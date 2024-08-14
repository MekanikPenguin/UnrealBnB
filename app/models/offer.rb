class Offer < ApplicationRecord
  # associations
  belongs_to :user
  has_many :bookings

  # validations
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  # cloudinary
  has_one_attached :photo

  # geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
