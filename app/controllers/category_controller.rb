# frozen_string_literal: true

class CategoryController < BaseController
  # GET /pokemon_categories
  # displays all pokemon categories
  def all
    categories = Category.all.order(:id)
    render json: categories
  end
end
