Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calendars#index', as: 'home'

  resources :calendars
  resources :events
end
