# frozen_string_literal: true

class CharacteristicSerializer < ActiveModel::Serializer
  attributes :generation, :height, :weight, :gender_male, :gender_female,
             :evolution_stage, :category, :color, :ability_hidden

  has_many :abilities
  has_many :pokemon_types

  def color
    object&.color&.name
  end

  def category
    object&.category&.name
  end

  def ability_hidden
    object&.ability_hidden&.name
  end
end
