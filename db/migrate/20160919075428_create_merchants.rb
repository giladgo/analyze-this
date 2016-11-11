class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :alternate_names, array: true, default: []
      t.string :logo_url
      t.references :category, foreign_key: true

      t.timestamps
    end

    add_index :merchants, :name, unique: true
  end
end
