class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :merchant, foreign_key: true
      t.integer :amount, null: false
      t.string :currency, null: false, default: 'ILS'
      t.integer :charge_amount, null: false
      t.integer :payment_ordinal, null: false, default: 1
      t.integer :payment_count, null: false, default: 1
      t.integer :fee_amount, null: false, default: 0
      t.string :fee_currency, null: false, default: 'ILS'
      t.datetime :txn_date, null: false

      t.timestamps
    end
  end
end
