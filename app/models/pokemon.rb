# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :ratings

  def rating_sum
    ratings&.count || 0
  end
end
