Passkeep::Application.routes.draw do

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'skedaddle' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :entries, :only => [:index, :new, :create, :update, :destroy] do
    #get 'tagged/:tag_name', :on => :collection
    get 'tagged/:tag_name' => 'entries#tagged', :on => :collection, :as => 'tagged'
    post 'paginate', :on => :collection
  end

  resources :projects, :except => [:show] do
    post 'search', :on => :collection
    post 'tagged_entries', :on => :member
    get 'confirm_destroy', :on => :member

    resources :entries, :only => [:edit, :confirm_destroy, :show] do
      get 'confirm_destroy', :on => :member
    end
  end

  post 'search' => 'search#index'

  resources :tags, :only => [:search]

  resources :teams, :except => [:show] do
    post 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end

  resources :users, :except => [:show] do
    post 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end
  root :to => "projects#index"

end
