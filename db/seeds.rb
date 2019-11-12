# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all
User.destroy_all

triviaapi = TriviaApi.new
categories = triviaapi.get_categories

categories.each do |category|
    Topic.create(name: category["name"], category_id: category["id"])
end

user = User.create(username: "jp7", password: "yolo", first_name: "Jeffrey", last_name: "Paulino", admin: true)
user2 = User.create(username: "jimmyc", password: "password", first_name: "Jimmy", last_name: "Cheung", admin: true)