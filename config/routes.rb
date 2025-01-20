Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, as: :http

  devise_for :users, path: "", path_names: {
    sign_in: "api/v1/login",
    sign_out: "api/v1/logout",
    registration: "api/v1/signup",
    check_token: "api/v1/sessions/check-token"
  },
  controllers: {
    sessions: "api/v1/users/sessions",
    registrations: "api/v1/users/registrations"
  }

  resources :score_boards do
    member do
      get "new_user"
      post "add_user"
      post "delete_user"
    end
    resources :scores do
      member do
        post "operation"
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :users do
        devise_scope :user do
          get "/check-token", to: "sessions#check_token"
        end
      end

      namespace :steps do
        post "/sync", to: "sync#update"
        get "/last-synced", to: "sync#last_synced"
      end
    end
  end
end
