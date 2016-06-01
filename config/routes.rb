Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, defaults: {format: :json}
    end
  end
end
