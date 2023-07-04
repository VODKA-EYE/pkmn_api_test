# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :ratings
  has_one :stat
  has_one :characteristic
  has_one :user, foreign_key: 'my_pokemon_id'

  # amount of ratings or zero
  def rating_sum
    ratings&.count || 0
  end
end
