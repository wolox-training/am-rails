class Rent < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :from_date, :to_date, presence: true
  validates_with RentDatesValidator, RentFromValidator, RentToValidator
end
