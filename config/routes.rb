Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :agsks do
    post :import, on: :collection
  end
end
