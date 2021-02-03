Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  resources :events, only:[:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
end
