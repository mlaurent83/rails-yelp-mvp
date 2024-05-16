class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true
  has_many :reviews, dependent: :destroy
  VALID_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"].freeze
  validates :category, inclusion: { in: VALID_CATEGORIES }
end
