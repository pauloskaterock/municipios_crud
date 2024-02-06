Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :municipes, only: [:index, :new, :create, :edit, :update]
end


# Rails.application.routes.draw do
#   # Rotas para Municipe
#   resources :municipes, only: [:index, :new, :create, :edit, :update]
# end
