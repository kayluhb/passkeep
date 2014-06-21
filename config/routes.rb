Rails.application.routes.draw do

  devise_for :users,
    path: 'auth',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock'
    }

  resources :entries, :teams, :users do
    get :confirm_destroy, on: :member
  end

  resources :projects do
    get :confirm_destroy, on: :member

    resources :entries, only: [:edit, :confirm_destroy, :show] do
      get :confirm_destroy, on: :member
    end
  end

  resources :search, only: [:index]

  root 'home#index'
end
