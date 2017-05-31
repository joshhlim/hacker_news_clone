class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable

  # def points
  #   votes.sum(:value)
  # end

end
