class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :total_price
  belongs_to :product
end
