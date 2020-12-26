Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  devise_scope :user do
    # get "user/id", to: "users/registrations#detail"
    # get "signup", to: "users/registrations#new"
    # get "login", to: "users/sessions#new"
    # protect from forgery with: -> getメソッドのみ許可している。sign_outはdeleteメソッドのためエラー
    get "logout", to: "users/sessions#destroy"
  end

  namespace :api do
    namespace :v1 do
      resources :purpose
    end
  end
end
