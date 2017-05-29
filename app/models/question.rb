class Question < ActiveRecord::Base
  belongs_to :questioner, class_name: :'User', foreign_key: :questioner_id
  has_many :answers

  validates :title, :body, :questioner_id, presence: true
end
