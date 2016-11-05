require 'csv'

class VisaCalDocumentParser < DocumentParser

  def parse(io)
    temp_file_path = parse_pdf(io)
    Rails.logger.debug("Generated text file from PDF: #{temp_file_path}")

    csv_file_path = parse_text_file(temp_file_path)
    Rails.logger.debug("Generated CSV file: #{csv_file_path}")

    parse_csv(csv_file_path)
  end

  private

  def parse_pdf(io)
    reader = PDF::Reader.new(io)
    temp_file = Tempfile.new('analyze_this_document')
    reader.pages.each do |page|
      temp_file.write(page.text)
    end

    temp_file.close
    temp_file.path
  end

  def parse_text_file(text_file_path)
    state = :idle
    post_transactions_delimiter_lines_counter = 0
    csv_file = Tempfile.new(['transactions', '.csv'])

    File.open(text_file_path).each do |line|
      if line.match(/ורבצנשתוקסעטוריפ/)
        state = :transactions_delimiter_start
        next
      elsif line.match(/ח.ל.ט/)
        state = :page_end
        next
      elsif line.match(/ךיראתלכ"הס/)
        state = :transactions_end
        next
      end

      if state == :transactions_delimiter_start
        if post_transactions_delimiter_lines_counter < 2
          post_transactions_delimiter_lines_counter += 1
          next
        else
          state = :transactions_start
          post_transactions_delimiter_lines_counter = 0
        end
      end

      if state == :transactions_start && line.match(/\d{2}\/\d{2}\/\d{4}/)
        transaction_line = line.gsub(/ (\d{2}\/\d{2}\/\d{4})/, '#\1')
        transaction_line.gsub!(/\s{3}אל\s{3}/, ' ')
        transaction_line.gsub!(/\s{3}[\S]*םולשת/, ' ')
        transaction_line.gsub!(/\s{3}[\S]*עבקתארוה/, ' ')
        transaction_line.gsub!(/"/, '')
        transaction_line.gsub!(/\s{2,}/, '#')
        transaction_line.strip!
        transaction_line.gsub!(/^#/, '')

        if transaction_line.split('#').length == 5
          # we managed to correctly parse the transaction line into the 5 expected fields
          csv_file.write("#{transaction_line}\n")
        else
          Rails.logger.warn("Could not have parsed this transaction: #{transaction_line}")
        end
      end
    end

    csv_file.close
    csv_file.path
  end

  def parse_csv(csv_file_path)
    transactions = []

    CSV.foreach(csv_file_path, col_sep: '#') do |row|
      transaction = DocumentParser::Transaction.new
      transaction.charge_amount = parse_amount(row[0])
      transaction.amount = parse_amount(row[1])
      transaction.category = row[2]
      transaction.merchant = row[3]
      transaction.date = row[4]

      transactions << transaction
    end

    transactions
  end

  def parse_amount(str)
    (str.slice(1, str.length - 1).gsub(',', '').to_f * 100).floor
  end

end