# frozen_string_literal: true

class BaseController < ApplicationController
  include UsersHelper
  before_action :auth_current_user

  def auth_current_user
    set_by_access_token
    head :unauthorized unless Current.user
  end
end
