require 'rails_helper'
require 'faker'

describe Rent do
  let(:user_id) { create(:user).id }
  let(:book_id) { create(:book).id }
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

  context 'without from date' do
    subject(:rent) do
      described_class.new(user_id: user_id,
                          book_id: book_id,
                          from_date: '',
                          to_date: to_date)
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'has from date error' do
      subject.valid?
      expect(subject.errors[:from_date].count).to be > 0
    end
  end

  context 'without from field date' do
    subject(:rent) do
      described_class.new(user_id: user_id,
                          book_id: book_id,
                          from_date: from_date,
                          to_date: '')
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'has to date field erros' do
      subject.valid?
      expect(subject.errors[:to_date].count).to be > 0
    end
  end
end
