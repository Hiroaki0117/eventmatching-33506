Rails.application.routes.draw do
  devise_for :users
  get 'entries/index'
  root to: 'events#index'
  resources :events, only:[:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'search'
    end
    resources :entries, only:[:index, :create]
  end
  
end
