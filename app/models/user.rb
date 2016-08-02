require 'securerandom'

class User < ApplicationRecord
  has_secure_password
  before_create :set_auth_token
  has_many :userwines, :dependent => :destroy

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 30 }

  private
  def set_auth_token
    if auth_token.nil?
      self.auth_token = SecureRandom.uuid.delete("-")
    end
  end
end
