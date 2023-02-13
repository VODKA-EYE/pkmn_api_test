# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  def attributes(*_args)
    object.attributes.symbolize_keys
  end
end
