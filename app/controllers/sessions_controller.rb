# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # overrided default  post users/sign_in, authorization
  def new
    if params[:login].present? && params[:password].present?
      # seaching login
      resource = User.find_for_database_authentication(login: params.require(:login))
      # if resource null/nil then error
      unless resource&.valid_password?(params[:password])
        render json: { error: true, message: 'Ne sovpadayet' },
               status: 400
      end
      resource.generate_access_token
      render json: { message: 'Successfuly authorized ', token: resource.token }
    else
      render json: { error: true, message: 'Login/Password HE BBEDEH' }, status: 400
    end
  end
end
