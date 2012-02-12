Passkeep::Application.routes.draw do

  devise_for :users

  resources :entries do
    get 'confirm_destroy', :on => :member
  end

  resources :projects do
    get 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end

  resources :tags, :only => [:search]

  resources :teams do
    get 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end

  resources :users do
    get 'search', :on => :collection
    get 'confirm_destroy', :on => :member
  end
  root :to => "entries#index"

end
