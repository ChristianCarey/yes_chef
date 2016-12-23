Rails.application.routes.draw do
  devise_for  :users, :controllers => { registrations: 'registrations' }


  namespace :chef do
    resources :menus
    resource :customers
    resource :orders
  end

  namespace :customer do
    resources :menus, only: [:index, :show] do
      resources :orders, except: [:index, :show]
    end
  end

  resources   :users do
    resource :profile
    resources :orders
  end

  resources :menu_items
  resources :ingredients

  resources :orders, only: [:index, :show]

  get '/send_invite' => 'users#send_invite'

  authenticated :user do
    root 'profiles#show', as: :authenticated_root
  end
  root to: 'application#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
