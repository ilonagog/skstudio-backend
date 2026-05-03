class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description. :price, :image_url, :stock_quantity
end
