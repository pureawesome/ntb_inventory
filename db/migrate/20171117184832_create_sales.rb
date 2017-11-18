class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :amount_full
      t.integer :amount_sample
      t.boolean :paid
      t.text :description
      t.references :product, index: true, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
