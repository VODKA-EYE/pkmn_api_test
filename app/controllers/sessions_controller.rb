# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def new
    if params[:email].present? && params[:password].present?
      resource = User.find_for_database_authentication(email: params.require(:email))
      unless resource&.valid_password?(params[:password])
        render json: { error: true, message: 'Ne sovpadayet' },
               status: 400
      end
      sign_in(:user, resource)
      resource.generate_access_token
      render json: { message: 'Success', token: resource.token }
    else
      render json: { error: true, message: 'Email/PASSWORD HE BBEDEH' }, status: 400
    end
  end

  private

  def access_token
    request.headers['token']
  end
end
