class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.boolean :is_popular, default: false
      t.boolean :is_new_arrival, default: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
