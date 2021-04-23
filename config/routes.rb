Rails.application.routes.draw do
  resources :flights, only: [:index, :show]
  resources :flight_passengers, only: [:destroy]
  resources :airlines, only: [:show]

end
