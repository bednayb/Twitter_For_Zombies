Rails.application.routes.draw do
  resources :tweets
  resources :zombies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :zombies do
    resources :tweets
  end
end
