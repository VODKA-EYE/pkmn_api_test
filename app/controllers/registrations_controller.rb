# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # Creates new account into database (just for easier testing, not necessary for current API)
  def create
    if params[:email].present? && params[:password_confirmation] == params[:password] && params[:password].present?
      user = User.new(email: params[:email], password: params[:password])
      if user.save
        render json: { message: 'Account created' }
      else
        render json: { error: true, message: user.errors.full_messages }
      end
    else
      render json: { error: true, message: 'Email/PASSWORD HE BBEDEH' }, status: 400
    end
  end
end
