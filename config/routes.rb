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

  resources :projects, :entries, :teams, :users, :search do
    get :confirm_destroy, on: :member
  end

  root 'home#index'
end
