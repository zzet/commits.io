CommitsIO::Application.routes.draw do
  # omniauth-github
  get '/auth/github/callback' => 'web/social_network#authorization'
  get '/auth/github/failure' => 'web/social_network#failure'

  scope :module => :web do
    root :to => 'welcome#show'
    resources :users, only: [:new, :create] 
    resource :session, only: [:new, :create, :destroy]

    resource :user, only: [:new, :create] do
      member do
        put :subscribe_course
        put :unscribe_course
      end
    end

    resource :social_network, :only => [] do 
      get :authorization, :on => :member
    end

  end
end
