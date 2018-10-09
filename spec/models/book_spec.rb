require 'rails_helper'

describe Book do
  %i[title genre author image publisher year].each do |field|
    it "validates presence of #{field}" do
      should validate_presence_of(field)
    end
  end
end
