class User < ApplicationRecord
  has_secure_password

  has_many :userwines, :dependent => :destroy

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 30 }

  def as_json(_ = nil)
    super(include: [:userwines])
  end

end
