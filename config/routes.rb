Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'authentication#login'
      resources :users do
        member do
          get :reservations
        end
        resources :rooms do
          resources :bookings, only: [:create, :destroy]
            member do
              get :check_availability
            end
        end
      end
    end
  end
end