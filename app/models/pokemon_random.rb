# frozen_string_literal: true

class PokemonRandom < ApplicationRecord
  belongs_to :pokemon

  class << self
    def set
      first_or_initialize.update(pokemon_id: Pokemon.order('random()').first.id)
    end

    def get
      first || set
      first.pokemon
    end
  end
end
