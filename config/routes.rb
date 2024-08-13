Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  get "/myoffers", to: "pages#myoffers"
  get "/mybookings", to: "pages#mybookings"
  resources :offers do
    resources :bookings, only: [:create,:destroy]
  end
end
