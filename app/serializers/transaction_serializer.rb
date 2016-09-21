class TransactionSerializer < ActiveModel::Serializer
  attributes :txn_date, :amount, :charge_amount, :fee_amount, :payment_ordinal, :payment_count
  belongs_to :merchant

  def amount
    Money.new(object.amount, object.currency).format
  end

  def charge_amount
    Money.new(object.charge_amount, object.currency).format
  end

  def fee_amount
    Money.new(object.fee_amount, object.fee_currency).format
  end
end