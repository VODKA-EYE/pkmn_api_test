# frozen_string_literal: true

class PokemonsSerializer < ActiveModel::Serializer
  attributes :id, :pokedex, :og_name, :name, :picture_url
end
