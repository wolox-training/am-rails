require 'faker'
require 'rails_helper'

describe Book do
  subject(:book) do
    book
  end

  context 'with all fields' do
    let(:book) { build(:book) }

    it 'is valid' do
      is_expected.to be_valid
    end
  end

  %i[genre author image title publisher year].each do |field|
    context "without #{field}" do
      let(:book) { build(:book, field => '') }

      it 'is not valid' do
        is_expected.to_not be_valid
      end

      it "contains a #{field} field error message" do
        subject.valid?
        expect(subject.errors[field].count).to be > 0
      end
    end
  end
end
