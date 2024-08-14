class Offer < ApplicationRecord
  # after_initialize :set_defaults

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

  # geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def set_defaults
    if self.url_image == nil
      self.url_image = "https://images.pexels.com/photos/691668/pexels-photo-691668.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    end
  end
end
