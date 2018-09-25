require 'faker'
require 'rails_helper'

describe Book do
  let(:genre) { Faker::Book.genre }
  let(:author) { Faker::Book.author }
  let(:image) { Faker::Internet.url }
  let(:title) { Faker::Book.title }
  let(:publisher) { Faker::Book.publisher }
  let(:year) { Faker::Date.backward(1000).year }

  context 'with all fields' do
    subject(:book) do
      described_class.new(genre: genre,
                          author: author,
                          image: image,
                          title: title,
                          publisher: publisher,
                          year: year)
    end

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without all fields' do
    subject(:book) do
      described_class.new(genre: genre,
                          author: author,
                          image: image,
                          title: title,
                          publisher: '',
                          year: year)
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains publisher field error' do
      subject.valid?
      expect(subject.errors[:publisher].length).to be > 0
    end
  end
end
