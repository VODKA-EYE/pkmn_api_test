# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # overrided default  post users/sign_in
  def new
    if params[:email].present? && params[:password].present?
      # seaching email
      resource = User.find_for_database_authentication(email: params.require(:email))
      # if resource null/nil then error
      unless resource&.valid_password?(params[:password])
        render json: { error: true, message: 'Ne sovpadayet' },
               status: 400
      end
      resource.generate_access_token
      render json: { message: 'Success', token: resource.token }
    else
      render json: { error: true, message: 'Email/PASSWORD HE BBEDEH' }, status: 400
    end
  end
end
