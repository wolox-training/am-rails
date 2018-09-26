require 'faker'
require 'rails_helper'

describe User do
  subject(:user) do
    user
  end

  context 'with all fields' do
    let(:user) { build(:user) }

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without first name' do
    let(:user) { build(:user, first_name: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains first name field error' do
      subject.valid?
      expect(subject.errors[:first_name].length).to be > 0
    end
  end

  context 'without last name' do
    let(:user) { build(:user, last_name: '') }

    it 'is not valid' do
      expect(subject.valid?).to eq(false)
    end

    it 'contains last name field error' do
      subject.valid?
      expect(subject.errors[:last_name].length).to be > 0
    end
  end
end
