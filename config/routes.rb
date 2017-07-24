Rails.application.routes.draw do
  resources :projects, only: [:index]
  resources :clients do
    resources :projects, except: [:index]
  end
end
