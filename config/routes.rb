PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
    member do
      post 'vote' #posts/2/vote ... collection do get 'archives' end goes to /posts/archives (everything, no id)
    end

    resources :comments, only: [:create] do
      member do
        post 'vote'
      end
    end
  end
  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update]

end
