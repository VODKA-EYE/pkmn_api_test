# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ratings

  # creates token in hex format for current user
  def generate_access_token
    update(token: SecureRandom.hex)
  end

  # removes token from current user
  def kill_token
    update(token: nil)
  end
end
