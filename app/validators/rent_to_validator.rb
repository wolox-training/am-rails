class RentToValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:to_date] << 'That book needs to be delivered before' unless
      should_skip(record) || from_date_available?(record)
  end

  def from_date_available?(record)
    rents = Rent.where('to_date > ?', record.to_date)
    rents = rents.where(from_date: (record.from_date..record.to_date))

    rents.empty?
  end

  # TODO: Remove this when shoulda-matchers is implemented
  def should_skip(record)
    !record.from_date || !record.to_date
  end
end
