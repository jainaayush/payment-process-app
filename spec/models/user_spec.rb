require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    context 'valid factories present' do
      it { build(:user).should be_valid }
    end

    context 'email' do
      context 'should be valid' do
        let(:valid) { build(:user, email: 'email@example.com') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:user, email: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'password' do
      context 'should be valid' do
        let(:valid) { build(:user, password: '123456') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid as not nil' do
        let(:invalid) { build(:user, password: nil) }
        it { expect(invalid).not_to be_valid }
      end

      context 'should be invalid as greater than 5 character or number' do
        let(:invalid) { build(:user, password: '12345') }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:merchants).with_foreign_key('admin_id') }
    it { is_expected.to have_many(:transactions) }
  end

  context 'callbacks' do
    it { is_expected.to callback(:check_associated_transaction).before(:destroy) }
  end
end
