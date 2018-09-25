require 'faker'
require 'rails_helper'

describe User do
  let(:email) { Faker::Internet.email }
  let(:password) { 'password' }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }

  context 'with all fields' do
    subject(:user) do
      described_class.new(email: email,
                          password: password,
                          password_confirmation: password,
                          first_name: first_name,
                          last_name: last_name)
    end

    it 'is valid' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without first name' do
    subject(:book) do
      described_class.new(email: email,
                          password: password,
                          password_confirmation: password,
                          first_name: '',
                          last_name: last_name)
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
      described_class.new(email: email,
                          password: password,
                          password_confirmation: password,
                          first_name: first_name,
                          last_name: '')
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
