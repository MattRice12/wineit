class Wine < ApplicationRecord
  has_many :userwines, :dependent => :destroy

  validates :type, uniqueness: true,
end
