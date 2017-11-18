class CreateBrews < ActiveRecord::Migration[5.1]
  def change
    create_table :brews do |t|
      t.integer :amount
      t.text :description
      t.references :product, index: true, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
