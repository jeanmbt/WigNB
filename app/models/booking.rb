class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :wig
  validates :start_date, :end_date, presence: true
  validates :start_date, :end_date, presence: true
end
