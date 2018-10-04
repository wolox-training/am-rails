require 'faker'

FactoryBot.define do
  factory :book_suggestion do
    title     { Faker::Book.title }
    author    { Faker::Book.author }
    link      { Faker::Internet.url }
    synopsis  { Faker::FamousLastWords.last_words }
    publisher { Faker::Book.publisher }
    year      { Faker::Number.between(1900, 2018) }
  end
end
