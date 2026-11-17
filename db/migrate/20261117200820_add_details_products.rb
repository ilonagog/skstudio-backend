class AddDetailsProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :color, :string
    add_column :products, :material, :string
    add_column :products, :category, :string
  end
end
