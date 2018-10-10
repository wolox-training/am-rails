class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :from_date, :to_date, presence: true
  validate :rent_dates, :book_is_already_rented, :book_has_to_be_delivered_before

  private

  def rent_dates
    return if from_date.nil? || to_date.nil?

    errors.add(:to_date, 'The end date of the rent is before the start date') if
      from_date > to_date
  end

  def book_is_already_rented
    return if from_date.nil? || to_date.nil?

    rents = Rent
            .where(book_id: book_id)
            .where('from_date <= ?', from_date)
            .where(to_date: (from_date..to_date))

    errors.add(:from_date, 'That book is in a rent that day') unless rents.empty?
  end

  def book_has_to_be_delivered_before
    return if from_date.nil? || to_date.nil?

    rents = Rent.where(book_id: book_id)
                .where('to_date > ?', to_date)
                .where(from_date: (from_date..to_date))

    errors.add(:to_date, 'That book needs to be delivered before') unless rents.empty?
  end
end
