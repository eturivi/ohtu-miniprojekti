Rails.application.routes.draw do
  resources :inproceedings
  root 'references#index'
  resources :articles
  get 'references', to: 'references#index'
  get 'articles/:id/download', to: 'articles#download', as: 'download'
  get 'references/download', to: 'references#download', as: 'alldownload'
end
