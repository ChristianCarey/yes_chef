Rails.application.routes.draw do
  devise_for  :users, :controllers => { registrations: 'registrations' }
  resources   :users
  resources   :menu_items
  resources   :menus
  resources    :orders
  authenticated :user do
    root 'users#current_user_home', as: :authenticated_root
  end
  root to: 'application#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
