class ItemCategory < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :category
end
