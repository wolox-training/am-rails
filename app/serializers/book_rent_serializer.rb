class BookRentSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image_url, :publisher, :year, :genre

  def image_url
    object.image
  end
end
