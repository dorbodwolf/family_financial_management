Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  root to: "home#index"

  resources :home, only: :index
  resources :accounts
  resources :incomes
  resources :expenses
  resources :posts do
    member do
      post :toggle_hidden
    end
  end
  resources :login_logs, only: :index
  resources :statistics, only: :index
  resources :users, only: :index
end
