Rails.application.routes.draw do
  devise_for :users
  get 'entries/index'
  root to: 'events#index'
  resources :events do
    collection do
      get 'search'
    end
    resources :entries, only:[:index, :create]
  end
  resources :users, only: :show do
    member do
      get 'mypage'
    end
  end
  
  
end
