Rails.application.routes.draw do
  get 'movies/index'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :index, only: :index
end
