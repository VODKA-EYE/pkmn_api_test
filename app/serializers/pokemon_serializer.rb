# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  has_one :characteristic
  has_one :stat

  # overrides attributes to provide all fields
  def attributes(*_args)
    hesh = object.attributes.except('created_at', 'updated_at', 'stats_id', 'characteristics_id')
    hesh.symbolize_keys
  end
end
