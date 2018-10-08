require 'faker'

FactoryBot.define do
  factory :book_suggestion do
    title     { Faker::Book.title }
    author    { Faker::Book.author }
    link      { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year      { Faker::Number.between(1900, 2018) }
  end
end
