require 'json'

class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org/api/books'

  def book_info(isbn)
    isbn_code = "ISBN#{isbn}"
    response = self.class.get('', options(isbn_code))[isbn_code]

    {
      ISBN: isbn,
      title: response['title'],
      subtitle: response['subtitle'],
      number_of_pages: response['number_of_pages'],
      authors: response['authors'].map { |data| data['name'] }
    }
  end

  private

  def options(isbn)
    {
      query: {
        bibkeys: isbn,
        format: 'json',
        jscmd: 'data'
      }
    }
  end
end
