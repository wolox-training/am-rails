class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, presence: true
  has_many :rents, dependent: :destroy
  has_many :books, through: :rents
  has_many :book_suggestions, dependent: :nullify
end
