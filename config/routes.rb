Rails.application.routes.draw do

  root to: 'combatants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :combatants

  resources :fighters, only: [ :create, :destroy ] do
    member do
      post 'add_weapon'
      post 'add_shield'
      post 'add_spell'
    end
  end

  resources :fights, only: [:show, :create]

end
