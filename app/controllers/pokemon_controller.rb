# frozen_string_literal: true

class PokemonController < BaseController
  include Paginatable
  before_action :find_pokemon, only: %i[update destroy]
  before_action :check_admin_role, only: %i[create destroy update]

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

  #
  # set random pokemon of the day
  def random
    render json: PokemonRandom.get
  end

  def create
    if pokemon_params.present?
      if PokemonService.new(pokemon_params, stats_params, characteristics_params).create
        render json: { message: 'Pokemon created' }
      else
        render json: { error: true, message: pokemon.errors.full_messages }
      end
    else
      render json: { error: true, message: 'Empty field' }, status: 400
    end
  end

  def destroy
    @pokemon.delete
  end

  def update
    @pokemon.update(pokemon_params)
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokedex, :og_name, :name, :picture_url)
  end

  def stats_params
    params.require(:stat).permit(:hp, :attack, :defence, :sp_attack, :sp_defence, :speed, :total)
  end

  def characteristics_params
    params.require(:characteristic).permit(:generation, :height, :weight, :gender_male, :gender_female,
                                           :evolution_stage, :category, :ability_hidden, :color, :pokemon_type)
  end

  def find_pokemon
    @pokemon ||= Pokemon.find_by_id(params[:id])
    render json: { error: true, message: 'Pokemon not found' } unless @pokemon
  end
end
