class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :wig
  has_many :renters, class_name: "User", foreign_key: :user_id
  validates :start_date, :end_date, presence: true
  validates :start_date, :end_date, presence: true
end
