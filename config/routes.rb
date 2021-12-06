Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :demands, only: %i[index new create delete show update]
  resources :materials do
    resources :bookings, only: %i[create]
  end
  resources :documents, only: %i[index]
  resources :messages, only: %i[index create]
  resources :buildings, only: %i[show]
  resources :users do
    collection do
      get :dashboard, to: 'pages#dashboard'
    end
  end
  get '/user' => "materials#index", :as => :user_root
end
