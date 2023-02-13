# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :ratings
end
