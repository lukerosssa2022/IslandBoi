class Booking < ApplicationRecord
  require 'date'
  before_create :cal_total_price
  belongs_to :user
  belongs_to :island

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_presence_of :start_date, :end_date
  validate :end_date_is_after_start_date

  def cal_total_price
    duration = (end_date - start_date).to_i
    duration * island.price_per_day
  end

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "has to be bigger than the start date") if end_date <= start_date
    errors.add(:start_date, "has to be bigger than today's date") if start_date < Date.today
  end
end

Date.today
