class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings

  COUNTRIES = ["Isreal", "Spain", "Germany", "South Africa"]

  validates :name, :territory, :price_per_day, :size, presence: true
  include PgSearch::Model

  pg_search_scope :global_search,
                  against: %i[name territory description],
                  associated_against: {
                    user: [:email]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
