# frozen_string_literal: true

class StatSerializer < ActiveModel::Serializer
  attributes :hp, :attack, :defence, :sp_attack, :sp_defence, :speed, :total
end
