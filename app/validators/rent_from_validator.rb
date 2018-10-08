class RentFromValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:from_date] << 'That book is in a rent that day' unless
    should_skip(record) || from_date_available?(record)
  end

  def from_date_available?(record)
    rents = Rent.where('from_date < ?', record.from_date)
    rents = rents.where(to_date: (record.from_date..record.to_date))

    rents.empty?
  end

  # TODO: Remove this when shoulda-matchers is implemented
  def should_skip(record)
    !record.from_date || !record.to_date
  end
end
