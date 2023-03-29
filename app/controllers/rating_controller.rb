# frozen_string_literal: true

class RatingController < ApplicationController
  include RatingsHelper

  # GET /pokemon/:id/rating
  # display rating of certain pokemon
  def show
    pokemon = Pokemon.find params[:id]
    render json: { rating: pokemon.rating_sum, name: pokemon.name }
  end

  # GET /rating
  # displays top rated pokemons
  def top
    render json: Rating.all_or_range(date_range).top(amount)
  end
end
