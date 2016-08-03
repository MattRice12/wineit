class User < ApplicationRecord
  has_secure_password

  has_many :userwines, :dependent => :destroy
  has_many :wines

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 30 }

end
