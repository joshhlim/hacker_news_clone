class User < ActiveRecord::Base
  has_many :questions, foreign_key: 'questioner_id', class_name: 'Question'
  has_many :answers, foreign_key: 'answerer_id', class_name: 'Answer'
end
