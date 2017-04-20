Rails.application.routes.draw do
  root 'references#index'
  resources :articles
  get 'references', to: 'references#index'
end
