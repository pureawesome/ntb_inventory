class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :quantity_full
      t.integer :quantity_sample
      t.boolean :paid
      t.integer :amount
      t.text :description
      t.references :product, index: true, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
