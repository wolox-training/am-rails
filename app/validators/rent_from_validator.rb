class RentFromUniquenessValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:from_date] << 'That book is in a rent that day' unless
      from_date_available?(record)
  end
end
