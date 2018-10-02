class RentSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date

  belongs_to :user
  belongs_to :book, serializer: BookRentSerializer
end
