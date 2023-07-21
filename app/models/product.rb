class Product < ApplicationRecord
  belongs_to :productable, polymorphic: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, :price, presence: true, numericality: { greater_than: 0}

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
end
