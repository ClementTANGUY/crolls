Rails.application.routes.draw do

  root to: 'combatants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :combatants

  resources :fighters, only: [ :create, :destroy ]

  resources :fights, only: [:show, :new, :create]

end
