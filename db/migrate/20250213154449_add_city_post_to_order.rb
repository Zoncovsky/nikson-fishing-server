class AddCityPostToOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :city, :string
    add_column :orders, :post_number, :string
    add_column :orders, :comment, :text
    add_column :orders, :status, :integer
  end
end
