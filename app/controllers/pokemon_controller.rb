# frozen_string_literal: true

class PokemonController < BaseController
  include Paginatable
  respond_to :json

  def all
    @pagy, pokemons = pagy(Pokemon.all)
    render json: { data: pokemons, meta: pagy_meta(@pagy) }
  end

  def show
    render json: Pokemon.find(params[:id])
  end
end
