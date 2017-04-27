Rails.application.routes.draw do
  resources :books
  resources :inproceedings
  root 'references#index'
  resources :articles
  get 'references', to: 'references#index'
  
  get 'articles/:id/download', to: 'articles#download', as: 'article_download'
  get 'inproceedings/:id/download', to: 'inproceedings#download', as: 'inproc_download'
  get 'books/:id/download', to: 'books#download', as: 'book_download'
  get 'references/download', to: 'references#download', as: 'alldownload'
end
