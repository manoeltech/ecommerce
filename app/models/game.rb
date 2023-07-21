class Game < ApplicationRecord
  belongs_to :system_requirement
  has_one :product, as: :productable
  validates :mode, presence: true, uniqueness: { case_sensitive: false }
  validates :release_date, :developer, presence: true

  enum mode: { pvp: 0, pve: 1, both: 3}
end
