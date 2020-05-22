Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stories do
    resources :situations do
      resources :choices, only: [:create, :destroy]
    end
  end
end

