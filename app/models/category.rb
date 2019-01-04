class Category < ApplicationRecord
  has_ancestry
  has_many :item_categories
  has_many :items, through: :item_categories
end
