class Coupon < ApplicationRecord
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :status, :due_date, presence: true
  validates :discount_value, presence: true, numericality: { onlY_integer: true, greater_than: 0 }

  enum status: { active: 1, inactive: 2 }
end
