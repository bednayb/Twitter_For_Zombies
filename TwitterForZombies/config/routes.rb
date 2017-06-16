Rails.application.routes.draw do
  resources :tweets
  resources :zombies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :zombies do
    put :custom_age, on: :member
    resources :tweets
    get :rotten, on: :member

  end

  # make specific url
  match '/zombies/:id/trymatch', to: 'zombies#show', via: :get

end
