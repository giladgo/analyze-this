class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :txn_date, :amount, :charge_amount, :fee_amount, :payment_ordinal, :payment_count, :charge_amount_formatted, :amount_formatted, :fee_amount_formatted
  belongs_to :merchant

  def amount_formatted
    Money.new(object.amount, object.currency).format
  end

  def charge_amount_formatted
    Money.new(object.charge_amount, object.currency).format
  end

  def fee_amount_formatted
    Money.new(object.fee_amount, object.fee_currency).format
  end
end
