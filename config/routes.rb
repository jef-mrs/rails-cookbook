Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'recipes#index'
  resources :recipe, except: :index do
    resources :step, only: %i[new create]
  end
  resources :step, only: %i[edit update destroy]
end
