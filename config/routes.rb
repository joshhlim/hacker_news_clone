Rails.application.routes.draw do

  get 'comments/new'

  get 'welcome/index'
  get 'welcome/new' => 'welcome#new'
  get 'welcome/ask' => 'welcome#ask'
  get 'welcome/link' => 'welcome#link'
  get 'welcome/text' => 'welcome#text'
  get 'welcome/comments' => 'welcome#comments'

  resources :users do
    resources :posts do
      member do
        post 'upvote'
      end
      resources :comments, only: [:index, :new, :create] do
        member do
          post 'upvote'
        end
      end
    end
  end

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
