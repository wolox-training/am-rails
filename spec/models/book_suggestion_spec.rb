require 'rails_helper'

describe BookSuggestion do
  subject(:book_suggestion) do
    book_suggestion
  end

  context 'with all fields' do
    let(:book_suggestion) { build(:book_suggestion) }
    it 'is valid' do
      is_expected.to be_valid
    end
  end

  %i[author title link publisher year].each do |field|
    context "without #{field}" do
      let(:book_suggestion) { build(:book_suggestion, field => '') }
      it 'is invalid' do
        is_expected.to_not be_valid
      end

      it "contains #{field} error messages" do
        book_suggestion.valid?
        expect(book_suggestion.errors[field].count).to_not be 0
      end
    end
  end
end
