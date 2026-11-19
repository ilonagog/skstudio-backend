class Product < ApplicationRecord
    has_many_attached :images
    has_many :reviews
    has_many :users, through: :reviews
end
