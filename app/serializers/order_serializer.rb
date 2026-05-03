class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :created_at

  belongs_to :user
  has_many :order_items
end
