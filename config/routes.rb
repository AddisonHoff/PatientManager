Rails.application.routes.draw do
  devise_for :doctors, :controllers => {
  registrations: 'doctor/registrations'
  }
  devise_for :patients, :controllers => {
  registrations: 'patient/registrations'
  }
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'patients#index'
  resources :patients

end
