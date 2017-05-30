# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Guitars")
Category.create(name: "Cars")

Article.create(title: "Old guitar", price: 50, body: "Selling my first electric guitar", key: "abc", email: "a@a.a", category_id: 1)
Article.create(title: "Broken guitar", price: 20, body: "Completely broken. Good luck.", key: "def", email: "b@b.b", category_id: 1)
Article.create(title: "Okay looking car", price: 8000, body: "It goes from point A to B most of the time.", key: "123", email: "c@c.c", category_id: 2)
Article.create(title: "Super awesome car", price: 100000, body: "You'll be in debt forever, but at least you have a cool car.", key: "456", email: "d@d.c", category_id: 2)
