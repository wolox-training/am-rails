require 'faker'

FactoryBot.define do
  factory :rent do
    user      { create(:user) }
    book      { create(:book) }
    from_date { Faker::Date.between(1.year.ago, 1.year.from_now) }
    to_date   { Faker::Date.forward(1000) }
  end
end
