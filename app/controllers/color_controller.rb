# frozen_string_literal: true

class ColorController < BaseController
  # GET /pokemon_colors
  # displays all pokemon colors
  def all
    colors = Color.all.order(:id)
    render json: colors
  end
end
