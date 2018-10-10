require 'faker'

# Admin User
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# 10 Books
10.times do
  Book.create!(genre: Faker::Book.genre,
               author: Faker::Book.author,
               image: Faker::Internet.url,
               title: Faker::Book.title,
               publisher: Faker::Book.publisher,
               year: Faker::Number.between(1900, 2018))
end

user1 = User.create!(first_name: 'Alejandro',
                     last_name: 'Ochoa',
                     password: 'password',
                     password_confirmation: 'password',
                     email: 'test@wolox.co')

user2 = User.create!(first_name: 'Test',
                     last_name: 'TestLastName',
                     password: 'password',
                     password_confirmation: 'password',
                     email: 'test@wolox.com.ar') if Rails.env.development?

Rent.create!(user: user1, book: Book.first, from_date: Time.zone.today, to_date: Time.zone.today + 10.days) if Rails.env.development?
Rent.create!(user: user2, book: Book.last, from_date: Time.zone.today, to_date: Time.zone.today + 10.days) if Rails.env.development?
