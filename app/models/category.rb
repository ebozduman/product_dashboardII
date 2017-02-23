class Category < ApplicationRecord
    has_many :products
    has_many :comments, through: :products
end
