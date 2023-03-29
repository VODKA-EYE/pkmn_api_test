# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  # takes token from request header
  def access_token
    request.headers['token']
  end
end
