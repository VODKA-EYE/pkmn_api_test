# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :user_id, uniqueness: { scope: :pokemon_id, message: ', You already liked this monster' }
end
