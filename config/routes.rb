Rails.application.routes.draw do
  devise_for :users
  root to: 'companies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :quotes, only: :index
    resources :bills, only: :index
    resources :customers do
      resources :quotes do
        resources :quote_services
        resources :services, only: [:new, :create]
        member do
          get :pdf
        end
      end
      resources :bills do
        resources :bill_services
        resources :services, only: [:new, :create]
        # member do
        #   get :pdf
        # end
      end
    end
    resources :services
  end
end
