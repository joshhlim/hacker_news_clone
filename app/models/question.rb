class Question < ActiveRecord::Base
  belongs_to :questioner, class_name: :'User', foreign_key: :questioner_id
  has_many :answers
end
