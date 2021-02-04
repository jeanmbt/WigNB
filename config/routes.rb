Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wigs, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  resource :dashboard, only: [ :show ]
  resources :bookings, only: [ :destroy, :show, :index ]

  delete "wigs/:id", to: "wigs#destroy", as: "delete_wig"

end
