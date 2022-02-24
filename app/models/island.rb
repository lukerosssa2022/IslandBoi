class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  has_one_attached :main_photo

  COUNTRIES = ["Isreal", "Spain", "Germany", "South Africa"]

  PHOTOS = ["https://www.treehugger.com/thmb/c8YBoBZfJLKUPGlFaQ7RT7J6xNA=/3840x2160/filters:fill(auto,1)/GettyImages-1296713537-aec94fc7c0154ed5812d2017e856f8d7.jpg",
            "https://cdn.cnn.com/cnnnext/dam/assets/180219103122-zanzibar-and-its-islands---mnemba-a-view-from-the-sky-mnemba-island-lodge.jpg",
            "https://www.treehugger.com/thmb/c8YBoBZfJLKUPGlFaQ7RT7J6xNA=/3840x2160/filters:fill(auto,1)/GettyImages-1296713537-aec94fc7c0154ed5812d2017e856f8d7.jpg",
            "https://cdn.cnn.com/cnnnext/dam/assets/180219103122-zanzibar-and-its-islands---mnemba-a-view-from-the-sky-mnemba-island-lodge.jpg"]

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
