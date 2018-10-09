require 'rails_helper'

describe User do
  %i[first_name last_name].each do |field|
    it "validates presence of #{field}" do
      should validate_presence_of(field)
    end
  end
end
