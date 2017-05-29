class User < ActiveRecord::Base
  has_many :questions, foreign_key: 'questioner_id', class_name: 'Question'
  has_many :answers, foreign_key: 'answerer_id', class_name: 'Answer'

  validates :username, :email, :password_hash, presence: true

  def self.authenticate?(email,password_hash)
    user = User.find_by(email: email)
    password_hash == user.password_hash
  end
end
