require 'faker'
require 'rails_helper'

describe Book do
  subject(:book) do
    build(:book)
  end

  it 'is valid with all atributes' do
    is_expected.to be_valid
  end

  it 'is not valid without a publisher' do
    subject.publisher = ''
    is_expected.to_not be_valid
    expect(subject.errors[:publisher].count).to be > 0
  end

  it 'is not valid without a genre' do
    subject.genre = ''
    is_expected.to_not be_valid
    expect(subject.errors[:genre].count).to be > 0
  end

  it 'is not valid without an author' do
    subject.author = ''
    is_expected.to_not be_valid
    expect(subject.errors[:author].count).to be > 0
  end

  it 'is not valid without an image' do
    subject.image = ''
    is_expected.to_not be_valid
    expect(subject.errors[:image].count).to be > 0
  end

  it 'is not valid without a title' do
    subject.title = ''
    is_expected.to_not be_valid
    expect(subject.errors[:title].count).to be > 0
  end

  it 'is not valid without a year' do
    subject.year = ''
    is_expected.to_not be_valid
    expect(subject.errors[:year].count).to be > 0
  end
end
