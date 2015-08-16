Rails.application.routes.draw do
  resources :users do
    resources :readings
  end
end
