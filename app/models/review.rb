class Review < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  #validations
  validates :rating, presence: true
  validates :content, presence: true, length: { minimum: 10, message: "must be at least 20 characters long" }
end
