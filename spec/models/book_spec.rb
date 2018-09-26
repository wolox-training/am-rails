require 'faker'
require 'rails_helper'

describe Book do
  context 'with all fields' do
    subject(:book) do
      build(:book)
    end

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without all fields' do
    subject(:book) do
      build(:book_without_publisher)
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains publisher field error' do
      subject.valid?
      expect(subject.errors[:publisher].count).to be > 0
    end
  end
end
