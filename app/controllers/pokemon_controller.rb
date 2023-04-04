# frozen_string_literal: true

class PokemonController < BaseController
  include Paginatable

  # GET /pokemon
  # displays all existing pokemons
  def all
    @pagy, pokemons = pagy(Pokemon.all.order(:id))
    render json: pokemons, adapter: :json, each_serializer: PokemonsSerializer, meta: pagy_meta(@pagy)
  end

  # GET /pokemon/:id
  # show only 1 pokemon by his ID
  def show
    render json: Pokemon.find(params[:id]),
           include: ['characteristic.abilities', 'characteristic.pokemon_types', 'stat']
  end

  # POST /pokemon/:id/like
  # give like to certain pokemon by current user
  def like
    rating = Rating.new(user_id: Current.user.id, pokemon_id: params[:id])
    if rating.save
      render json: { respond: 'Successful' }
    else
      render json: { error: true, message: rating.errors.full_messages }
    end
  end

  # DELETE /pokemon/:id/like
  # remove like of certain pokemon by current user
  def remove_like
    rating = Rating.find_by(user_id: Current.user.id, pokemon_id: params[:id])
    if rating&.delete
      render json: { respond: 'Successful' }
    else
      render json: { error: true, message: 'Never existed' }, status: 404
    end
  end
end
