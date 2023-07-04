# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ratings

  enum :role, %i[user admin]

  # creates token in hex format for current user
  def generate_access_token
    update(token: SecureRandom.hex) until token
    update(last_entry: Time.now)
  end

  # removes token from current user
  def kill_token
    update(token: nil)
  end

  def email_required?
    false
  end
end
