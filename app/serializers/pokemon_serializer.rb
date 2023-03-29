# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  belongs_to :ability1
  belongs_to :ability2
  belongs_to :ability_hidden
  belongs_to :color
  belongs_to :egg_group1
  belongs_to :egg_group2
  belongs_to :type1
  belongs_to :type2
  belongs_to :category

  # overrides attributes to provide all fields
  def attributes(*_args)
    object.attributes.symbolize_keys
  end
end
