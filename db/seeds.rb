# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  username = Faker::Internet.user_name
  email = Faker::Internet.safe_email
  user = User.create(username: username, email: email, password_hash: 'password')
end

15.times do
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraphs.join('\n\n')
  questioner = User.all.sample
  Question.create(title: title, body: body, questioner_id: questioner.id)
end

20.times do
  body = Faker::Lorem.paragraph
  question = Question.all.sample
  answerer = User.where.not(id: question.questioner.id).sample
  Answer.create(body: body, question_id: question.id, answerer_id: answerer.id)
end
