Rails.application.routes.draw do
  root to: "desired_ingredients#new"
  resources :finders, only: [:index, :show, :delete]
  resources :desired_ingredients, only: [:new, :create]
  resources :recipes
  delete 'clear_pot', to: 'desired_ingredients#clear_pot'
end
