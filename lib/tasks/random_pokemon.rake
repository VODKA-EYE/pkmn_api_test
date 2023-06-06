# frozen_string_literal: true

namespace :pokemons do
  desc 'Set random pokemon'
  task random: :environment do
    PokemonRandom.set
  end
end
