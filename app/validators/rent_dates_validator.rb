class RentDatesValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:from_date] << 'The end date of the rent is before the start date' unless
      valid_rent_dates?(record)
  end

  private

  def valid_rent_dates?(record)
    record.from_date && record.to_date && record.from_date < record.to_date
  end
end
