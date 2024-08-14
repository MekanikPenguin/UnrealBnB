class Offer < ApplicationRecord

  # cloudinary
  has_one_attached :image

  # associations
  belongs_to :user
  has_many :bookings

  # validations
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
