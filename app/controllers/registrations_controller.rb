# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    if params[:email].present? && params[:password_confirmation] == params[:password] && params[:password].present?
      user = User.new(email: params[:email], password: params[:password])
      if user.save
        render json: { message: 'Nakonec zaregan' }
      else
        render json: { error: true, message: user.errors.full_messages.to_s }
      end
    else
      render json: { error: true, message: 'Email/PASSWORD HE BBEDEH' }, status: 400
    end
  end
end
