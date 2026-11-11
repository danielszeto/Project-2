Rails.application.routes.draw do
  root "pages#home"
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  get "/sign_in", to: "sessions#new", as: :sign_in
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :products
end
