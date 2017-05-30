class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :url, :body, presence: true
end
