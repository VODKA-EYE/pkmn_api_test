# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :user_id, uniqueness: { scope: :pokemon_id, message: ', You already liked this monster' }

  # making class into singleton class, to not type self. to every method
  class << self
    def all_or_range(date_range)
      date_range ? where(created_at: eval(date_range)..Time.now) : all
    end

    def vse
      group(:pokemon_id).count
    end

    def sorted_asc
      vse.sort_by { |_k, v| v }.reverse
    end

    def top(amount)
      sorted_asc.first(amount).map { |k, v| { pokemon_id: k, rating: v } }
    end
  end
end
