Ambassadors::Application.routes.draw do
  resources :credit_types

  resources :event_types

  resources :events

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
