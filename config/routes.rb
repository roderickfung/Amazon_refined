Rails.application.routes.draw do
  root 'indexes#index'
  resources :abouts, only: [:new]
  resources :contacts, only: [:new]

  resources :users, only: [:new, :create, :edit, :update, :show] do
    delete :destroy, on: :collection
  end

  resources :products do
    resources :reviews, only: [:create, :destroy, :index]
    resources :favorites, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
