Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  
  resource :user, only: [:show]

end