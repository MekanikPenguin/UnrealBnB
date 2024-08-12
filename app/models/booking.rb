class Booking < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :offer

  #validations
  validates :user_id, presence: true
  validates :offer_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
