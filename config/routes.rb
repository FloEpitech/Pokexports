Rails.application.routes.draw do
  root "pokemons#index"
  resources :pokemons, only: [:index] do
    collection do
      post :export, format: :csv  # Utilisation de POST pour l'export CSV
    end
  end
end
