Rails.application.routes.draw do
  
  get 'welcome/index'

  resources :articles do
	  resources :comments
	end
  devise_for :author, controllers: { sessions: 'author/sessions' }

  # resources :users, only: [:new, :create]
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  # resources :sessions

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
