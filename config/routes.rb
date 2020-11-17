Rails.application.routes.draw do
  devise_for :patients
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'patients#index'
  resources :patients

end
