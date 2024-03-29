Ambassadors::Application.routes.draw do
  resources :deadlines


  match 'reports/monthly' => 'reports#monthly', :via => [:get, :post]
  match 'reports/yearly' => 'reports#yearly', :via => [:get, :post]
  match 'reports/yearly' => 'reports#destroy_year', :via => [:delete]
  match 'reports/export' => 'reports#export', :via => [:get]
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
  match 'events/:id/registrations' => 'registrations#eventIndex'

  match '/registrations' => 'registrations#fullIndex'

  match 'users/manage' => 'users#manage', :via => [:get]
  devise_for :users
  resources :users, :except => [:create, :new] do
    resources :registrations, :as => 'event_registrations'
  end

  match 'events/:id/add' => 'events#add'
  match 'about_ambassadors' => 'home#about_ambassadors'
  match 'about_ait' => 'home#about_ait'
  match 'ambassadors_letter' => 'home#ambassadors_letter'
  match 'ait_letter' => 'home#ait_letter'
  match 'events_report' => 'events#report'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
end
