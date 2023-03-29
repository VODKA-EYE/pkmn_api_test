# frozen_string_literal: true

class PokemonTypeController < BaseController
  # GET /pokemon/types
  # displays all pokemon types
  def all
    pokemon_types = PokemonType.all.order(:id)
    render json: pokemon_types
  end
end
