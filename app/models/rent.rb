class Rent < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :book

  validates_with RentDatesValidator, RentFromUniquenessValidator, RentFromValidator
  validates :user_id, :book_id, :from_date, :to_date, presence: true
end
