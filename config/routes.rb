class RepositoryConstraint
  def matches?(request)
    (Committer.exists?(name: request.params[:owner]) || 
     Organization.exists?(name: request.params[:owner])) && 
      Repository.exists?(name: request.params[:repository])
  end
end

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
    get '/:owner/:repository' => 'repositories#show', :constraints => RepositoryConstraint.new
    get '/:owner/:repository/commits' => 'repositories/commits#index', :constraints => RepositoryConstraint.new
  end
end
