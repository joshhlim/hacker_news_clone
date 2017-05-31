class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable, dependent: :destroy

  # def points
  #   votes.sum(:value)
  # end

end
