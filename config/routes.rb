Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  get "/myoffers", to: "pages#myoffers", as: "myoffers"
  get "/mybookings", to: "pages#mybookings", as: "mybookings"

  resources :offers do

    # REVIEW: Bookings should probably be separated in two controllers :
    # - one for the offer owner (accept/reject)
    # - one for people booking (create booking, cancel)

    resources :bookings, only: [:create, :destroy]
    resources :reviews, only: :create
  end

  resources :bookings, only: [] do
    # Review:
    # Utiliser les methodes rails CRUD/restful quand c'est possible:
    # e.g. put/update pour accept et delete/destroy pour reject
    member do
      patch 'accept'
      patch 'reject'
    end
  end
end
