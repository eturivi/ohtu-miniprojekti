Rails.application.routes.draw do
  get '/', to: 'references#index'
  resources :articles
end
