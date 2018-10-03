require 'faker'

FactoryBot.define do
  factory :rent do
    user_id { create(:user).id }
    book_id { create(:book).id }
    from_date { Faker::Date.between(1.year.ago, 1.year.from_now)}
    to_date { Faker::Date.forward(1000) }
  end
end
