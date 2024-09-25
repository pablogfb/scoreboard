Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

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
end
