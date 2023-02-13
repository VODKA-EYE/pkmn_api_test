# frozen_string_literal: true

module UsersHelper
  def set_by_access_token
    return unless access_token

    Current.user = User.find_by(token: access_token)
  end
end
