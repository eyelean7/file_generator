Rails.application.routes.draw do
  get '/search/' => 'search#index', as: 'search'
  resources :projects, only: [:index]
  resources :clients do
    resources :projects, except: [:index]
  end
end
