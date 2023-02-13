# frozen_string_literal: true

class RatingController < ApplicationController
  include RatingsHelper

  def show
    pokemon = Pokemon.find params[:id]
    render json: { rating: pokemon.rating_sum, name: pokemon.name }
  end

  def top
    render json: Rating.all_or_range(date_range).top_10
  end

  private

  def rating_params
    params.permit(:date_range)
  end
end
