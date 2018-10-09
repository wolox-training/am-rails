require 'rails_helper'

describe BookSuggestion do
  %i[author title link publisher year].each do |field|
    it "it validates presence of #{field}" do
      should validate_presence_of field
    end
  end
end
