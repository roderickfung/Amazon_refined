class Review < ApplicationRecord
  belongs_to :product

  validates :body, presence: true
  validates :star_count, presence: true
  validates :product_id, presence: true
end
