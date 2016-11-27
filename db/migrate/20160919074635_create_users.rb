class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :account_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :access_token
      t.string :refresh_token

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :account_id, unique: true
  end
end
