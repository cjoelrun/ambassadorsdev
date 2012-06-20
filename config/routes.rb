Ambassadors::Application.routes.draw do
  resources :registration_statuses
  resources :credit_types
  resources :event_types
  resources :events

  devise_for :users
  resources :users, :except => [:destroy, :create, :new] do
    resources :registrations
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  match "events/:id/add" => "events#add"
end
