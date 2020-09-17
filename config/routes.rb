Rails.application.routes.draw do
  root to: "tops#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :blogs, only: [:index, :new, :create]
end
