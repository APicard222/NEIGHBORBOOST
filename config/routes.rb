Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :demands, only: %i[index new create delete]
  resources :buildings, only: %i[show] do
    resources :materials

    resources :documents, only: %i[index]
    resources :messages, only: %i[index]
  end
  resources :users do
    collection do
      get :dashboard, to: 'pages#dashboard'
    end
  end
end
