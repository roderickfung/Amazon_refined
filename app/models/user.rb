class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_products, through: :favorites, source: :product

  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

end
