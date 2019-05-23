Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :places
  resources :events
  resources :tickets do
    collection do
      get :shopping
    end
  end
  
  resources :user_tickets do
    collection do
        get :index_shopping_bag
    end
  end

  root :to => 'sessions#new'

  post '/login',   to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in


end
