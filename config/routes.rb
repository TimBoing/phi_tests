Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/tests", to: 'pages#tests'
  get "/return_situation", to: 'situations#return_situation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stories do
    resources :situations do
      resources :choices, only: [:create, :destroy, :update]
    end
  end
end


