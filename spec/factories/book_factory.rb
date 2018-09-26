require 'faker'
FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Date.backward(1000).year }
  end

  factory :book_without_publisher, class: Book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url }
    title { Faker::Book.title }
    publisher { '' }
    year { Faker::Date.backward(1000).year }
  end
end
