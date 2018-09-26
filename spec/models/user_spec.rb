require 'faker'
require 'rails_helper'

describe User do
  context 'with all fields' do
    subject(:user) do
      build(:user)
    end

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without first name' do
    subject(:user) do
      build(:user_without_firstname)
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains first name field error' do
      subject.valid?
      expect(subject.errors[:first_name].length).to be > 0
    end
  end

  context 'without last name' do
    subject(:book) do
      build(:user_without_lastname)
    end

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains last name field error' do
      subject.valid?
      expect(subject.errors[:last_name].length).to be > 0
    end
  end
end
