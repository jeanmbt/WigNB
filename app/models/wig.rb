class Wig < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  
  validates :description, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  validates :color, length: { maximum: 10,
    too_long: "%{count} characters is the maximum allowed" }
  validates :name, length: { maximum: 20,
    too_long: "%{count} characters is the maximum allowed" }
  validates :color, :name, :description, :material, :style, presence: true
end
