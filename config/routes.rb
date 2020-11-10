Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
    root to: 'items#index'
    resources :items do
      resources :orders, only:[:index, :create, :order]
      post 'order', on: :member
      # resources :items, only: :order do
      # post 'order', on: :member
      resources :comments, only: :create
    end
  resources :users, only:[:show, :edit, :update]
  resources :cards, only: [:new, :create]

end
