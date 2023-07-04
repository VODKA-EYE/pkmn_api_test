# frozen_string_literal: true

class QuizQuestion < ApplicationRecord
  def pokemons
    Pokemon.where(id: pokemon_ids)
  end
end
