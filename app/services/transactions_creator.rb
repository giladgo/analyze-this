class TransactionsCreator
  def self.create_transactions(user, raw_transactions)
    raw_transactions.each do |transaction|
      Rails.logger.debug "Storing transaction: #{transaction.date} #{transaction.merchant} #{transaction.amount}"

      category = Category.where("name = ? OR ? = ANY (alternate_names)", transaction.category, transaction.category).first
      category = Category.create!(name: transaction.category) if category.nil?
      merchant = Merchant.where("name = ? OR ? = ANY (alternate_names)", transaction.merchant, transaction.merchant).first
      merchant = Merchant.create!(name: transaction.merchant, category: category) if merchant.nil?
      user.transactions.create!(merchant: merchant, amount: transaction.amount, charge_amount: transaction.charge_amount, txn_date: transaction.date)
    end
  end
end