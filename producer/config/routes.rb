Rails.application.routes.draw do
  resources :cats, only: [:index, :create, :destroy]
end
