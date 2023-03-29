# frozen_string_literal: true

class AbilityController < BaseController
  # GET /pokemon_abilities
  # displays all pokemons abilities
  def all
    abilities = Ability.all.order(:id)
    render json: abilities
  end
end
