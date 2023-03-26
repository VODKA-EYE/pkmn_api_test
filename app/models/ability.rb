# frozen_string_literal: true

class Ability < ApplicationRecord
  has_many :ability1_pokemons, class_name: 'Pokemon', foreign_key: 'ability1_id'
  has_many :ability2_pokemons, class_name: 'Pokemon', foreign_key: 'ability2_id'
  has_many :ability_hidden_pokemons, class_name: 'Pokemon', foreign_key: 'ability_hidden_id'
end
