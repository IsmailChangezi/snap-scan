Rails.application.routes.draw do
  devise_for :users
  resources :categories do 
  resources :payments
  end
  root "home#index"
  get 'about_us', to: 'home#about_us'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
