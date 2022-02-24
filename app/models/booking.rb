class Booking < ApplicationRecord
  before_create :cal_total_price
  belongs_to :user
  belongs_to :island

  validates :start_date, presence: true
  validates :end_date, presence: true

  def cal_total_price
    duration = (end_date - start_date).to_i
    duration * island.price_per_day
  end
end
