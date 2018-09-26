require 'faker'
require 'rails_helper'

describe User do
  subject(:user) do
    build(:user)
  end

  it 'is valid with all fields' do
    is_expected.to be_valid
  end

  it 'is not valid without a first_name' do
    subject.first_name = ''
    is_expected.to_not be_valid
    expect(subject.errors[:first_name].count).to be > 0
  end

  it 'is not valid without a last_name' do
    subject.last_name = ''
    is_expected.to_not be_valid
    expect(subject.errors[:last_name].count).to be > 0
  end
end
