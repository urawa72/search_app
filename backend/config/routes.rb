Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: [] do
        get :full_search, on: :collection
      end
    end
  end
end
