# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destory_all
Product.destory_all
Transaction.destory_all

User.create ({
 email: "daniel@daniel.com",
 first_name: "daniel",
 last_name: "Szeto",
 password_digest: "Password",
 location: "sunset",
 bio: "I like ice cream and things",
 kind: nil,
 age: 25,
  })

