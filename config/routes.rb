Rails.application.routes.draw do
 
  resources :categories #=> [7, :create, :show, :index, :edit, :new, :update, :destroy]
  resources :all, only: [:index]
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:show] 
  resources :posts do
    resources :comments
  end

  get '/posts/:id/body', to: 'posts#body'

  root 'welcome#home'

end ## routes end
