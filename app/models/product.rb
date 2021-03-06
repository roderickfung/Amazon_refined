class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category
  belongs_to :user

  validates :title, presence: true, uniqueness: {message: 'must be unique.'}
  validates :description, presence: true, length: {minimum: 10}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :category_id, presence: true

  after_initialize :set_price_default_to_1
  before_validation :capitalize_title

  def self.search(v)
      where("title ILIKE ? OR description ILIKE ?", "%#{v}%", "%#{v}%")
  end

  def fav_for(user)
    favorites.find_by_user_id user
  end

  private

  def set_price_default_to_1
    self.price ||= 1
  end

  def capitalize_title
    self.title = title.titleize if title
  end


end
