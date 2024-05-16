class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true
  has_many :reviews, dependent: :destroy
  VALID_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"].freeze
  validates :category, inclusion: { in: VALID_CATEGORIES }
  def average_rating
    reviews.average(:rating).round(2) if reviews.present?
  end
end
