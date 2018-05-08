Rails.application.routes.draw do
  root 'home#index'

  resources :lectures do
   resources :comments
   member do 
    put 'like'
   end 
  end
  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
