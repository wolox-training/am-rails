class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :genre,
             :created_at, :updated_at
end
