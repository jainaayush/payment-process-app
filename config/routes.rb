Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :merchants, except: %i[new create]

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:create] do
        member do
          put :charge
          put :refund
          put :reverse
        end
      end
      post :authenticate, to: 'account#authenticate'
    end
  end
end
