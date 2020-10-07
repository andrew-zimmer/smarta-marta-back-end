Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: {format: :json} do
    resource :sessions, only: [:create, :destroy]
    resources :users, only: [:create]
    resources :quick_picks, only: [:destroy, :create, :update]
  end
end
