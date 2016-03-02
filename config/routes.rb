Rails.application.routes.draw do
 
  resources :categories
  resources :all, only: [:index]
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, only: [:show] do 
    resources :posts, only: [:show, :index, :new, :edit, :create, :update, :destroy]
  end

  get '/posts/:id/body', to: 'posts#body'

  root 'welcome#home'

end ## routes end
