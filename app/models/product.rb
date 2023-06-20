class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :orders
  has_many :carts

  # default_scope { order(:name) }
end
