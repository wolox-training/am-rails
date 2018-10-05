require 'rails_helper'

describe Rent do
  subject(:rent) do
    rent
  end

  context 'with all fields' do
    let(:rent) { build(:rent) }
    it 'is valid' do
      is_expected.to be_valid
    end
  end

  %i[book_id user_id from_date to_date].each do |field|
    context "without #{field}" do
      let(:rent) { build(:rent, field => '') }
      it 'is invalid' do
        is_expected.to_not be_valid
      end

      it "contains #{field} error messages" do
        rent.valid?
        expect(rent.errors[field].count).to_not be 0
      end
    end
  end
end
