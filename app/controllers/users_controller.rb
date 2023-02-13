# frozen_string_literal: true

class UsersController < BaseController
  def log_out
    return unless access_token
    return unless Current.user

    Current.user.kill_token
    render json: { message: 'Token killed' }
  end

  def user_info
    render json: Current.user
  end
end
