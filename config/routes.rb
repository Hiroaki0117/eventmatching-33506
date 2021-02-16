Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'entries/index'
  root to: 'events#index'
  resources :events do
    collection do
      get 'search'
    end
    resources :entries, only:[:index, :create]
    resource :likes, only:[:create, :destroy]
  end
  resources :users, only: [:show, :new] do
    member do
      get 'mypage'
    end
  end
  
  
end
