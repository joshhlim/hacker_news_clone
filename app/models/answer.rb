class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: :'User', foreign_key: :answerer_id

  validates :body, :question_id, :answerer_id, presence: true
end
