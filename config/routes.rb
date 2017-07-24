Rails.application.routes.draw do
  resources :clients do
    resources :projects
  end
end
