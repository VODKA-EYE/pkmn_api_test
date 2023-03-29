# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :user_id, uniqueness: { scope: :pokemon_id, message: ', You already liked this monster' }

  # making class into singleton class, to not type self, to every method
  class << self
    # if date_range not nil then apply date_range or select all
    def all_or_range(date_range)
      date_range ? where(created_at: eval(date_range)..Time.now) : all
    end

    # count all grouped by pokemon_id
    def vse
      group(:pokemon_id).count
    end

    # ascending sort of selected pokemons
    def sorted_asc
      vse.sort_by { |_k, v| v }.reverse
    end

    # display most liked pokemons and how much of them
    def top(amount)
      sorted_asc.first(amount).map { |k, v| { pokemon_id: k, rating: v } }
    end
  end
end
