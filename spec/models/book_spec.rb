require 'faker'
require 'rails_helper'

describe Book do
  subject(:book) do
    book
  end

  context 'with all fields' do
    let(:book) { build(:book) }

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without publisher' do
    let(:book) { build(:book, publisher: '')}

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains publisher field error' do
      subject.valid?
      expect(subject.errors[:publisher].count).to be > 0
    end
  end

  context 'without genre' do
    let(:book) { build(:book, genre: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains genre field error' do
      subject.valid?
      expect(subject.errors[:genre].count).to be > 0
    end
  end

  context 'without author' do
    let(:book) { build(:book, author: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains author field error' do
      subject.valid?
      expect(subject.errors[:author].count).to be > 0
    end
  end

  context 'without image' do
    let(:book) { build(:book, image: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains image field error' do
      subject.valid?
      expect(subject.errors[:image].count).to be > 0
    end
  end

  context 'without title' do
    let(:book) { build(:book, title: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains title field error' do
      subject.valid?
      expect(subject.errors[:title].count).to be > 0
    end
  end

  context 'without year' do
    let(:book) { build(:book, year: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains year field error' do
      subject.valid?
      expect(subject.errors[:year].count).to be > 0
    end
  end
end
