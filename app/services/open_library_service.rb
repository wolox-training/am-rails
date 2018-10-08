class OpenLibraryService
  include HTTParty
  base_uri ENV['API_BOOK_URL']

  FORMAT = 'json'.freeze
  JSCMD = 'data'.freeze

  # Keys
  TITLE = 'title'.freeze
  SUBTITLE = 'subtitle'.freeze
  N_PAGES = 'number_of_pages'.freeze
  AUTHORS = 'authors'.freeze

  def initialize(isbn)
    @isbn = isbn
    @options = {
      query: {
        bibkeys: @isbn,
        format: FORMAT,
        jscmd: JSCMD
      }
    }
  end

  def book_info
    response = retrieve_from_api
    format_response response
  end

  private

  def retrieve_from_api
    response = self.class.get('', @options)
    raise "No book found with code #{@isbn}" if response.body == '{}'

    response
  end

  def format_response(response)
    response = response[@isbn]

    {
      ISBN: @isbn,
      title: response[TITLE],
      subtitle: response[SUBTITLE],
      number_of_pages: response[N_PAGES],
      authors: response[AUTHORS].map { |data| data['name'] }
    }
  end
end
