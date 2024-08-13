Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers do
    resources :bookings, only: [:index, :new, :create, :destroy]
    post 'book', on: :member
  end
end
