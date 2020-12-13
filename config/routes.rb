Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
      }

      # devise_scope :user do
      #   get "user/:id", :to => "users/registrations#detail"
      #   get "signup", :to => "users/registrations#new"
      #   get "login", :to => "users/sessions#new"
      #   get "logout", :to => "users/sessions#destroy"
      # end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
