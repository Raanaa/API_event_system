Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms do
        resources :bookings, only: [:create, :destroy]
        member do
          get :check_availability
        end
      end

    end
  end
end