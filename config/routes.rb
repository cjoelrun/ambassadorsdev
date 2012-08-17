Ambassadors::Application.routes.draw do
  resources :years

  resources :committees
  resources :apparels
  resources :registration_statuses
  resources :credit_types
  resources :event_types

  resources :events do
    match 'search' => 'events#search',
          on: :collection, via: [:get, :post], as: :search
  end

  devise_for :users
  resources :users, :except => [:destroy, :create, :new] do
    resources :registrations, :as => 'event_registrations'
  end

  match "events/:id/add" => "events#add"
  match "about_ambassadors" => "home#about_ambassadors"
  match "about_ait" => "home#about_ait"
  match "ambassadors_letter" => "home#ambassadors_letter"
  match "ait_letter" => "home#ait_letter"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
end
