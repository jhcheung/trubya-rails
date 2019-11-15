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

image1 = Image.create(img_url: "https://mk0patonixing8t2q1dw.kinstacdn.com/wp-content/uploads/2019/07/cropped_MI_main_harry_potter.jpg", answer: "Harry Potter")
image2 = Image.create(img_url: "https://i.ytimg.com/vi/nlGyoBZZdeQ/maxresdefault.jpg", answer: "naruto run")
image3 = Image.create(img_url: "https://cdn.shopify.com/s/files/1/0059/8835/2052/articles/Apple_Trees-1024x743_1024x1024.jpg?v=1549698607", answer: "apple tree")
image4 = Image.create(img_url: "https://www.sciencenewsforstudents.org/sites/default/files/scald-image/860-dragon-header-iStock-494839519.gif", answer: "dragon")
image5 = Image.create(img_url: "https://static.parade.com/wp-content/uploads/2019/07/AskMarilyn.Parachutes-FTR-1.jpg", answer: "parachute")
image6 = Image.create(img_url: "https://burness.com/img/containers/main/sesame-street-in-communities.jpg/a68041b235dfee42e96bf0cf36f4e343.jpg", answer: "big bird")
image7 = Image.create(img_url: "https://www.ancient-origins.net/sites/default/files/field/image/Unshakeable-Power-of-Zeus.jpg", answer: "Zeus")
image8 = Image.create(img_url: "https://dnyuz.com/wp-content/uploads/2019/07/Shaq-started-investing-like-Jeff-Bezos-%E2%80%98I-probably-quadrupled-what.JPG", answer: "Shaq")
image9 = Image.create(img_url: "https://cdn.vox-cdn.com/thumbor/7Va4gyh3WVAwTbBD1re27lhmieA=/0x0:960x729/1200x800/filters:focal(322x231:474x383)/cdn.vox-cdn.com/uploads/chorus_image/image/56734989/nintchdbpict000297124102.0.jpg", answer: "salt bae")
image10 = Image.create(img_url: "https://assets1.ignimgs.com/2019/03/17/charizardvspikachu-blogroll-1552795616798.jpg", answer: "charizard")