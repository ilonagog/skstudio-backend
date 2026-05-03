class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image_url, :first_name, :last_name
  # has_many :
end
