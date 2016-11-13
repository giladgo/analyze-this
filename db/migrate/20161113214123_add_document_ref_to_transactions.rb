class AddDocumentRefToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :document, foreign_key: true
  end
end
