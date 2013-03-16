class RepositoryConstraint
  def matches?(request)
    (
      Committer.exists? login: requests.params[:owner]
      || Organization.exists? name: requests.params[:owner]
    )
    && Repository.exists? name: requests.params[:repository]
  end
end

CommitsIO::Application.routes.draw do
  # omniauth-github
  get '/auth/github/callback' => 'web/social_network#authorization'
  get '/auth/github/failure' => 'web/social_network#failure'

  scope :module => :web do
    root :to => 'welcome#show'
    resources :users, only: [:new, :create] 
    resource :session, only: [:new, :create, :destroy]

    resources :profiles, only: [:show]

    resource :user, only: [:new, :create] do
      member do
        put :subscribe_course
        put :unscribe_course
      end
    end

    resource :social_network, :only => [] do 
      get :authorization, :on => :member
    end

    get '/:owner/:repository' => 'repositories#show', :constraints => RepositoryConstraint.new
    get '/:owner/:repository/commits' => 'repositories#commits#index', :constraints => RepositoryConstraint.new
  end
end
