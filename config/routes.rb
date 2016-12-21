Rails.application.routes.draw do
  root to: 'application#landing_page'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources  :users
  resources  :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
