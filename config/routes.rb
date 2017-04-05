Rails.application.routes.draw do
  get '/', to: 'references#index'
  resources :articles
  get 'references', to: 'references#index'
end
