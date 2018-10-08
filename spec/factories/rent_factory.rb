require 'faker'

FactoryBot.define do
  factory :rent do
    user      { create(:user) }
    book      { create(:book) }
    from_date { Faker::Date.between(1.year.ago, Time.zone.today) }
    to_date   { Faker::Date.forward(1000) }
  end
end
