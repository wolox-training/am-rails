FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    password   { 'password' }
    password_confirmation   { 'password' }
  end

  factory :user_without_firstname, class: User do
    first_name { '' }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    password   { 'password' }
    password_confirmation   { 'password' }
  end

  factory :user_without_lastname, class: User do
    first_name { Faker::Name.first_name }
    last_name  { '' }
    email      { Faker::Internet.email }
    password   { 'password' }
    password_confirmation   { 'password' }
  end
end
