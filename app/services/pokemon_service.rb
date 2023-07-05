# frozen_string_literal: true

class PokemonService
  def initialize(pokemon_params, stats_params, characteristics_params)
    @pokemon_params = pokemon_params
    @stats_params = stats_params
    @characteristics_params = characteristics_params
  end

  def create
    return if @pokemon_params.empty?

    stat = Stat.create(@stats_params)
    characteristic = Characteristic.create(@characteristics_params)
    pokemon = Pokemon.new(@pokemon_params.merge({ "characteristics_id": characteristic.id, "stats_id": stat.id }))

    return unless pokemon.save

    stat.update(pokemon_id: pokemon.id)
    characteristic.update(pokemon_id: pokemon.id)
  end
end
