require 'rails_helper'

describe Rent do
  let(:user_id) { User.first.id }
  let(:book_id) { Book.first.id }
  let(:from_date) { Faker::Date.forward(1) }
  let(:to_date) { Faker::Date.forward(100) }

  context 'with all fields' do
    subject(:rent) do
      described_class.new(user_id: user_id,
                          book_id: book_id,
                          from_date: from_date,
                          to_date: to_date)
    end

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without all fields' do
    subject(:rent) do
      described_class.new(user_id: user_id,
                          book_id: book_id,
                          from_date: from_date,
                          to_date: '')
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains publisher field error' do
      subject.valid?
      expect(subject.errors[:to_date].length).to be > 0
    end
  end
end
