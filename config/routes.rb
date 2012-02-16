Passkeep::Application.routes.draw do

  devise_for :users

  resources :entries, :only => [:index, :new, :create, :update, :destroy] do
    #get 'tagged/:tag_name', :on => :collection
    get 'tagged/:tag_name' => 'entries#tagged', :on => :collection, :as => 'tagged'
  end

  resources :projects do
    post 'search', :on => :collection
    get 'confirm_destroy', :on => :member

    resources :entries, :only => [:edit, :confirm_destroy, :show] do
      get 'confirm_destroy', :on => :member
    end
  end

  resources :tags, :only => [:search]

  resources :teams, :except => [:show] do
    get 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end

  resources :users do
    post 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end
  root :to => "projects#index"

end
