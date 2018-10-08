class RentFromUniquenessValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:from_date] << 'That book is already rented for that day' unless
      from_date_available?(record)
  end

  private

  def from_date_available?(record)
    rents = Rent.where book_id: record.book_id, from_date: record.from_date
    rents.empty?
  end
end
