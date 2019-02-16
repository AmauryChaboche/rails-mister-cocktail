Rails.application.routes.draw do

  get 'doses/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:new, :create, :show, :index] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  root to: 'cocktails#index'

  get 'letter', to: 'cocktails#letter'
end
