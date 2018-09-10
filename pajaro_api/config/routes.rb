Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :twerps
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :twerps do
          resources :comments do
            resource :session, only: :create
          end
        end
      end
    end
  end
end
