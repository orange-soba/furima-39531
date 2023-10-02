Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :rooms, only: [:index, :update] do
      resource :messages, only: [:create]
    end
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
