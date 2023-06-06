# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  def create
    return unless params['user']['password'] && params['user']['email']

    user = User.find_by_email params['user']['email']
    user.password = params['user']['password']
    if user.save
      render json: { message: 'Password changed' }
    else
      render json: { error: true, message: user.errors.full_messages }
    end
  end
end
