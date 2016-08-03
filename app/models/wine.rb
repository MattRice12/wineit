class Wine < ApplicationRecord
  has_many :userwines, :dependent => :destroy
  belongs_to :user

  # validates :type, uniqueness: true,
end
