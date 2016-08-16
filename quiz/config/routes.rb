Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/requests/update/:id' => 'requests#index', as: :update_request
  post "/requests/:search" => "requests#index", as: :search_request


  resources :requests

  root 'requests#index'


end
