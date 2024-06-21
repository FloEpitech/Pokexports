Rails.application.routes.draw do
  root "pokemons#index"
  resources :pokemons, only: [:index] do
    collection do
      post :export
    end
  end
end
