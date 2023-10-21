Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: "items#index"
  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :rooms, only: [:index, :update] do
      resources :messages, only: [:create, :destroy]
    end
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
