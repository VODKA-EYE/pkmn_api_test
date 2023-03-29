# frozen_string_literal: true

class EggTypeController < BaseController
  # GET /pokemon_egg_types
  # displays all pokemon eggs types
  def all
    egg_types = EggType.all.order(:id)
    render json: egg_types
  end
end
