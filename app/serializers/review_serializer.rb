class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :product_id, :user_id
  has_one :user
  has_one :product
end
