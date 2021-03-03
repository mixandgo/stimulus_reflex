Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
  root "site#index"

  resources :posts, only: [:new, :create]
end
