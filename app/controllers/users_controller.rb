# frozen_string_literal: true

class UsersController < BaseController
  # removes token of current user
  def log_out
    return unless access_token
    return unless Current.user

    Current.user.kill_token
    render json: { message: 'Token killed' }
  end

  # shows all info about current user
  def user_info
    users = User.all.order(:id)
    render json: users
  end
end
