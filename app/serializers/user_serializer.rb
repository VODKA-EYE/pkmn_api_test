# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :login, :role, :last_entry
end
