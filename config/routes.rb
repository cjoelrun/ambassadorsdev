Ambassadors::Application.routes.draw do
  resources :apparels

  resources :registration_statuses
  resources :credit_types
  resources :event_types
  resources :events
  resources :apparels

  devise_for :users
  resources :users, :except => [:destroy, :create, :new] do
    resources :registrations
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  match "events/:id/add" => "events#add"
  
  match "about_ambassadors" => "home#about_ambassadors"
  match "about_ait" => "home#about_ait"
  match "ambassadors_letter" => "home#ambassadors_letter"
  match "ait_letter" => "home#ait_letter"
end
