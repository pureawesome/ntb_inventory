class CreateBrews < ActiveRecord::Migration[5.1]
  def change
    create_table :brews do |t|
      t.integer :quantity_full
      t.integer :quantity_sample
      t.text :description
      t.references :product, index: true, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
