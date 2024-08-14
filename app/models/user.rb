class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # cloudinary
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, through: :bookings
  has_many :offers
  has_many :bookings, dependent: :destroy

  after_initialize :set_defaults

  #validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def set_defaults
    if self.url_image == nil
      self.url_image = "https://kitt.lewagon.com/placeholder/users/ssaunier"
    end
  end
end
