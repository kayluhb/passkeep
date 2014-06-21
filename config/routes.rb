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

  resources :entries, :projects, :teams, :users do
    get :confirm_destroy, on: :member
  end

  resources :search, only: [:index]

  root 'home#index'
end
