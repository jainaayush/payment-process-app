require 'rails_helper'

RSpec.describe MerchantsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # adjust the attributes here as well.
  login_user

  let(:valid_attributes) do
    attributes_for(:user).merge(admin_id: current_user.id, role: 'merchant')
  end

  let(:invalid_attributes) { attributes_for(:user, email: nil) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      merchant = User.create! valid_attributes
      get :show, params: { id: merchant.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      merchant = User.create! valid_attributes
      get :edit, params: { id: merchant.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { email: 'cust123@mail.com', description: 'related text' } }

      it 'updates the requested merchant' do
        merchant = User.create! valid_attributes
        put :update, params: { id: merchant.to_param, user: new_attributes }, session: valid_session
        merchant.reload
        expect(merchant.email).to eq new_attributes[:email]
        expect(merchant.description).to eq new_attributes[:description]
      end

      it 'redirects to the merchant' do
        merchant = User.create! valid_attributes
        put :update, params: { id: merchant.to_param, user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(merchant_url(merchant))
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the edit template)' do
        merchant = User.create! valid_attributes
        put :update, params: { id: merchant.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested merchant' do
      merchant = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: merchant.to_param }, session: valid_session
      end.to change(User, :count).by(0)
    end

    it 'redirects to the merchants list' do
      merchant = User.create! valid_attributes
      delete :destroy, params: { id: merchant.to_param }, session: valid_session
      expect(response).to redirect_to(merchants_url)
    end
  end
end
