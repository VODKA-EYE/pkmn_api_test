# frozen_string_literal: true
# Nasleduyet CurrentAttributes, access to user from anywhere
class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
