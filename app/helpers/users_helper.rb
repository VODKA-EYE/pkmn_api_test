# frozen_string_literal: true

module UsersHelper
  # sets global current user by access token from headers
  def set_by_access_token
    return unless access_token

    Current.user = User.find_by(token: access_token)
  end
end
