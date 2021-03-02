Rails.application.routes.draw do
  root "site#index"

  resources :posts, only: [:new, :create]
end
