require 'json'

module Response
  module JSONParser
    def decompose_paginated_json(paginated_json)
      JSON.parse(paginated_json)['page'][0][1]
    end
  end
end
