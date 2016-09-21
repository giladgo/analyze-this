class SetTransactionDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column :transactions, :amount, :integer, null: false
    change_column :transactions, :charge_amount, :integer, null: false
    change_column :transactions, :txn_date, :datetime, null: false
    change_column :transactions, :currency, :string, null: false, default: 'ILS'
    change_column :transactions, :payment_ordinal, :integer, null: false, default: 1
    change_column :transactions, :payment_count, :integer, null: false, default: 1
    change_column :transactions, :fee_amount, :integer, null: false, default: 0
    change_column :transactions, :fee_currency, :string, null: false, default: 'ILS'
  end
end
