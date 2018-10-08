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

  context 'with start date after end date' do
    let(:rent) { build(:rent, from_date: Time.zone.today + 2.days, to_date: Time.zone.today) }

    it 'is invalid' do
      is_expected.to_not be_valid
    end
  end

  context 'overlapping' do
    let(:book) { create(:book) }
    let(:from) { Time.zone.today }
    let(:to)   { from + 10.days }
    let!(:previous_rent) { create(:rent, book: book, from_date: from, to_date: to) }

    context 'startin the same day' do
      let(:rent) { build(:rent, book: book, from_date: from) }

      it 'is not valid' do
        is_expected.to_not be_valid
      end

      it 'contains :from_date errors' do
        rent.valid?
        expect(rent.errors[:from_date].count).to_not be 0
      end
    end

    context 'starting in the middle of a rent' do
      let(:rent) { build(:rent, book: book, from_date: from + 5.days, to_date: to + 5.days) }

      it 'is not valid' do
        is_expected.to_not be_valid
      end

      it 'contains :from_date errors' do
        rent.valid?
        expect(rent.errors[:from_date].count).to_not be 0
      end
    end

    context 'finishing in the middle of a rent' do
      let(:rent) { build(:rent, book: book, from_date: from - 5.days, to_date: to - 5.days) }

      it 'is not valid' do
        is_expected.to_not be_valid
      end

      it 'contains :to_date errors' do
        rent.valid?
        expect(rent.errors[:to_date].count).to_not be 0
      end
    end
  end
end
