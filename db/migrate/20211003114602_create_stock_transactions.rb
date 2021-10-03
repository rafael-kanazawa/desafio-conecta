class CreateStockTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_transactions do |t|
      t.references :stock, foreign_key: true
      t.integer :quantity
      t.integer :action

      t.timestamps
    end
  end
end
