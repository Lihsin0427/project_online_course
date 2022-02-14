Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "courses#index"
  resources :courses, param: :url
  resources :categories
  resources :admins, path: "/427liHsinPractice", only: [:index] do
    collection do
      post :become_admin
      post :cancel_admin
    end
  end
end
