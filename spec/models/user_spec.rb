require 'rails_helper'

describe User do
  subject(:user) do
    user
  end

  context 'with all field' do
    let(:user) { build(:user) }

    it 'is valid' do
      is_expected.to be_valid
    end
  end

  %i[first_name last_name].each do |field|
    context "without #{field}" do
      let(:user) { build(:user, field => '') }
      it 'is invalid' do
        is_expected.to_not be_valid
      end

      it "contains #{field} error messages" do
        subject.valid?
        expect(subject.errors[field].count).to be > 0
      end
    end
  end
end
