Rails.application.routes.draw do
  get '/search/' => 'search#index', as: 'search'
  resources :projects, only: [:index] do
    get '/invoice/' => 'projects#invoice', as: 'invoice'
    resources :jobs
  end
  resources :clients do
    resources :projects, except: [:index]
  end
end
