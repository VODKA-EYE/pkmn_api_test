# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :login, :role, :last_entry, :my_pokemon

  def my_pokemon
    object&.my_pokemon_id
  end
end
