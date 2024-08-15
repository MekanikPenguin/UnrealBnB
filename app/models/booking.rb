class Booking < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :offer

  #validations
  validates :user_id, presence: true
  validates :offer_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: %w[pending accepted rejected] }

  # Scopes to filter bookings by status
  scope :pending, -> { where(status: 'pending') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :rejected, -> { where(status: 'rejected') }
end
