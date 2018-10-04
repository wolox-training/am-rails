require 'json'

class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org/api/books'

  def self.book_info(isbn)
    options = {
      query: {
        bibkeys: "ISBN:#{isbn}",
        format: 'json',
        jscmd: 'data'
      }
    }
    get('', options).body
  end
end
