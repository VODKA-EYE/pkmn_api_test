# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :ratings
  belongs_to :ability1, class_name: 'Ability', optional: true
  belongs_to :ability2, class_name: 'Ability', optional: true
  belongs_to :ability_hidden, class_name: 'Ability', optional: true
  belongs_to :color, optional: true
  belongs_to :egg_group1, class_name: 'EggType', optional: true
  belongs_to :egg_group2, class_name: 'EggType', optional: true
  belongs_to :type1, class_name: 'PokemonType', optional: true
  belongs_to :type2, class_name: 'PokemonType', optional: true
  belongs_to :category, optional: true

  # summarize ratings count of object or zero
  def rating_sum
    ratings&.count || 0
  end
end
