require 'json'

module Response
  module JSONParser
    def decompose_paginated_json(paginated_json)
      JSON.parse(paginated_json)['page']
    end

    def json_to_hash(json)
      JSON.parse(json)
    end
  end
end
