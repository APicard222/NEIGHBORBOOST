Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :demands, only: %i[index new create delete show update]
  resources :materials do
    resources :bookings, only: %i[create]
  end
  resources :documents, only: %i[index]
  resources :messages, only: %i[index create] do
    collection do
      get :count, to: 'messages#count'
    end
  end
  resources :buildings, only: %i[show]
  resources :users do
    collection do
      get :dashboard, to: 'pages#dashboard'
      get :materials, to: 'pages#my_materials'
      get :demands, to: 'pages#my_demands'
    end
  end
  get '/user' => "materials#index", :as => :user_root
end
