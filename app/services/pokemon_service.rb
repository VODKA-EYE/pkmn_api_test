# frozen_string_literal: true

class PokemonService
  def initialize(pokemon_params, stats_params, characteristics_params, id = nil)
    @pokemon_params = pokemon_params
    @stats_params = stats_params
    @characteristics_params = characteristics_params
    @id = id
  end

  def create
    return if validate

    stat = Stat.create(@stats_params)
    characteristic = Characteristic.create(@characteristics_params)
    pokemon = Pokemon.new(@pokemon_params.merge({ "characteristics_id": characteristic.id, "stats_id": stat.id }))

    return unless pokemon.save

    stat.update(pokemon_id: pokemon.id)
    characteristic.update(pokemon_id: pokemon.id)
  end

  def update
    return unless @id

    pokemon = Pokemon.find_by_id @id

    return unless pokemon

    pokemon.stat.update(@stats_params)
    pokemon.characteristic.update(@characteristics_params)
    pokemon.update(@pokemon_params)
  end

  private

  def validate
    @pokemon_params.empty?
  end
end
