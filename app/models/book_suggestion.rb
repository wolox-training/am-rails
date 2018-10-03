class BookSuggestion < ApplicationRecord
  belongs_to :user

  validates :synopsis, :author, :title, :link, :publisher, :year, presence: true
end
