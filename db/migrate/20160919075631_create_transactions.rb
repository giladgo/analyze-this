class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :merchant, foreign_key: true
      t.integer :amount
      t.string :currency
      t.integer :charge_amount
      t.integer :payment_ordinal
      t.integer :payment_count
      t.integer :fee_amount
      t.string :fee_currency
      t.date :txn_date

      t.timestamps
    end
  end
end
