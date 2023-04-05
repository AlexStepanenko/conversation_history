Rails.application.routes.draw do
  root to: 'projects#index'

  resources :projects, only: [:index, :show] do
    resources :comments, only: [:create]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
