require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validations' do
    context 'valid factories present' do
      it { build(:transaction).should be_valid }
    end

    context 'customer email' do
      context 'should be valid' do
        let(:valid) { build(:transaction, customer_email: 'cust1@mail.com') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:transaction, customer_email: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'customer phone' do
      context 'should be valid' do
        let(:valid) { build(:transaction, customer_phone: '9876543210') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:transaction, customer_phone: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:merchant).required }
  end

  context 'callbacks' do
    it { is_expected.to callback(:set_uuid).after(:initialize) }
  end
end
