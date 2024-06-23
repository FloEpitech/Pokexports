class PokemonsController < ApplicationController
  require 'csv'
  require 'httparty'

  def index
    @pokemons = fetch_pokemons.select { |pokemon| pokemon["generation"] == 1 }
  end

  def export
    selected_pokemons = params[:pokemons] || []
    pokemons_data = selected_pokemons.map { |id| fetch_pokemon_details(id) }
    csv_data = generate_csv(pokemons_data)

    send_data csv_data, filename: "pokemons.csv", type: 'text/csv; charset=utf-8'
  end

  private

  def fetch_pokemons
    response = HTTParty.get('https://mon-api-pokemon.vercel.app/api/v1/pokemon')
    if response.success?
      JSON.parse(response.body)
    else
      []
    end
  end

  def fetch_pokemon_details(id)
    response = HTTParty.get("https://mon-api-pokemon.vercel.app/api/v1/pokemon/#{id}")
    if response.success?
      JSON.parse(response.body)
    else
      {}
    end
  end

  def generate_csv(pokemons)
    CSV.generate(col_sep: ';') do |csv|
      csv << ["Pokedex ID", "Nom en Français", "Sprite Regular", "Sprite Shiny", "Types", "Évolutions"]

      pokemons.each do |pokemon|
        pokedex_id = pokemon["pokedex_id"] || "N/A"
        name_fr = pokemon["name"]["fr"] || "N/A"
        sprite_regular = pokemon["sprites"]["regular"] || "N/A"
        sprite_shiny = pokemon["sprites"]["shiny"] || "N/A"
        types = (pokemon["types"] || []).map { |type| type["name"] }.join(",")

        evolutions = ""
        if pokemon["evolution"] && pokemon["evolution"]["next"]
          evolutions = pokemon["evolution"]["next"].map { |evo| evo["pokedex_id"] }.join(",")
        end

        csv << [pokedex_id, name_fr, sprite_regular, sprite_shiny, types, evolutions]
      end
    end
  end
end
