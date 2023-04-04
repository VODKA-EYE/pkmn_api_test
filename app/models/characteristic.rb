# frozen_string_literal: true

class Characteristic < ApplicationRecord
  has_and_belongs_to_many :abilities
  belongs_to :ability_hidden, class_name: 'Ability', foreign_key: 'ability_hidden_id', optional: true
  has_and_belongs_to_many :pokemon_types
  belongs_to :category, optional: true
  belongs_to :color, optional: true
end
