Rails.application.routes.draw do

  resources :users
  resources :products 

   get "/sign_in", to: "sessions#new"

   post "/sessions", to: "sessions#create"

   delete "/logout", to: "sessions#destroy", as: "logout"

   get "products/regular", to: "products#show", as: "regular"
   get "products/organic", to: "products#show", as: "organic"
   get "products/glutonfree", to: "products#show", as: "glutonfree"
   get "products/vegan", to: "products#show", as: "vegan"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

#       Prefix Verb   URI Pattern                    Controller#Action
#        users GET    /users(.:format)               users#index
#              POST   /users(.:format)               users#create
#     new_user GET    /users/new(.:format)           users#new
#    edit_user GET    /users/:id/edit(.:format)      users#edit
#         user GET    /users/:id(.:format)           users#show
#              PATCH  /users/:id(.:format)           users#update
#              PUT    /users/:id(.:format)           users#update
#              DELETE /users/:id(.:format)           users#destroy
#     products GET    /products(.:format)            products#index
#              POST   /products(.:format)            products#create
#  new_product GET    /products/new(.:format)        products#new
# edit_product GET    /products/:id/edit(.:format)   products#edit
#      product GET    /products/:id(.:format)        products#show
#              PATCH  /products/:id(.:format)        products#update
#              PUT    /products/:id(.:format)        products#update
#              DELETE /products/:id(.:format)        products#destroy
#      sign_in GET    /sign_in(.:format)             sessions#new
#     sessions POST   /sessions(.:format)            sessions#create
#       logout DELETE /logout(.:format)              sessions#destroy
#      regular GET    /products/regular(.:format)    products#regular
#      organic GET    /products/organic(.:format)    products#regular
#   glutonfree GET    /products/glutonfree(.:format) products#regular
#        vegan GET    /products/vegan(.:format)      products#regular
#         root GET    /                              welcome#index
end
