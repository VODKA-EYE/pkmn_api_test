# frozen_string_literal: true

class PokemonController < BaseController
  include Paginatable

  def all
    @pagy, pokemons = pagy(Pokemon.all)
    render json: { data: pokemons, meta: pagy_meta(@pagy) }
  end

  def show
    render json: Pokemon.find(params[:id])
  end

  def like
    rating = Rating.new(user_id: Current.user.id, pokemon_id: params[:id])
    if rating.save
      render json: { respond: 'Successful' }
    else
      render json: { error: true, message: rating.errors.full_messages.to_s }
    end
  end

  def dislike
    rating = Rating.find_by(user_id: Current.user.id, pokemon_id: params[:id])
    if rating&.delete
      render json: { respond: 'Successful' }
    else
      render json: { error: true, message: 'Never existed' }, status: 404
    end
  end
end
