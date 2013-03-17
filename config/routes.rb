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

    scope :module => :users do
      namespace :settings do
        post :activate_repository
        put :update_personal
      end
    end

    # private
    get '/dashboard' => 'users#dashboard'
    get '/profile' => 'users#profile'
    get '/settings/repositories' => 'users/settings#repositories'
    get '/settings/personal' => 'users/settings#personal'

    # public
    get '/profiles/:login' => 'users#profile'
    get '/:owner/:repository/commits/:sha' => 'repositories/commits#show', constraints: { owner: /[a-zA-Z.\/0-9_\-]+/, repository: /[a-zA-Z.\/0-9_\-]+/ }
    get '/:owner/:repository/commits' => 'repositories/commits#index', constraints: { owner: /[a-zA-Z.\/0-9_\-]+/, repository: /[a-zA-Z.\/0-9_\-]+/ }
    get '/:owner/:repository' => 'repositories#show', constraints: { owner: /[a-zA-Z.\/0-9_\-]+/, repository: /[a-zA-Z.\/0-9_\-]+/ }
  end
end
