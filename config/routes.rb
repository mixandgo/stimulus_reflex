Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
  root "site#index"

  resources :posts, only: [:new, :create] do
    member do
      resources :likes, only: [:create]
      resources :comments, only: [:create]
    end
  end
end
