class AddLogoUrlToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :logo_url, :string
  end
end
