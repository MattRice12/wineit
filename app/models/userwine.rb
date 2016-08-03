class Userwine < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  def as_json(_ = nil)
    super(include: [:wine])
  end

  # anytime I need to make an association in javascript, I have to bring the association in through 'as_json'.
  # this is because javascript cannot make SQL queries.
  # thus, I have to make a "care-package" to bring with me into JavaScript so I can get all of the information I need.
  # If I go on a picnic, I need to pack up food to bring with me from home to eat outside. I can't go home when I want mayo (i.e., I can't make a SQL query from within JavaScript)
end
