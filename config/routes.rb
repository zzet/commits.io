CommitsIO::Application.routes.draw do
  # omniauth-github
  get '/auth/github/callback' => 'web/social_network#authorization'
  get '/auth/github/failure' => 'web/social_network#failure'

  scope :module => :web do
    root :to => 'welcome#show'
    resource :session, only: [:new, :create, :destroy]

    resource :social_network, :only => [] do 
      get :authorization, :on => :member
    end

    resource :hook, only: :create

    get :profile, controller: :users, action: :profile
    get :dashboard, controller: :users, action: :dashboard

    scope :module => :users do
      namespace :settings do
        get :repositories
        get :personal
        post :activate_repository
        put :update_personal
      end
    end

    resources :profiles, only: [:show], controller: :users
    resources :users, only: [], constraints: { owner: /[a-zA-Z.\/0-9_\-]+/ }, path: "/" do
      resources :repositories, only: [:show], constraints: { repository: /[a-zA-Z.\/0-9_\-]+/ }, path: "/" do
        scope module: :repositories do
          resources :commits, only: [:index, :show]
        end
      end
    end
  end
end
