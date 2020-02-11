# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all
User.destroy_all
Game.destroy_all
Question.destroy_all

triviaapi = TriviaApi.new
categories = triviaapi.get_categories

categories.each do |category|
    Topic.create(name: category["name"], category_id: category["id"])
end

user = User.create(username: "jp7", password: "yolo", first_name: "Jeffrey", last_name: "P", admin: true)
user2 = User.create(username: "jimmyc", password: "password", first_name: "Jimmy", last_name: "C", admin: true)

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
image11 = Image.create(img_url: "https://www.pirateshipvallarta.com/blog/wp-content/uploads/2017/04/the-kraken-legend-or-beast-1050x554.jpg", answer: "kraken")
image12 = Image.create(img_url: "https://c402277.ssl.cf1.rackcdn.com/photos/14785/images/story_full_width/shutterstock_532108075.jpg?1512507049", answer: "sloth")
image13 = Image.create(img_url: "https://wallpapercave.com/wp/wp3968594.jpg", answer: "dab")
image14 = Image.create(img_url: "https://www.dailydot.com/wp-content/uploads/2019/05/RIP-grumpy-cat.jpg", answer: "grumpy cat")
image15 = Image.create(img_url: "https://3wt9g11xou5g1onsz01tdv74-wpengine.netdna-ssl.com/wp-content/uploads/2018/11/Hulk-Hogan2-800x400.jpg
    ", answer: "hulk hogan")
image16 = Image.create(img_url: "https://s3951.pcdn.co/wp-content/uploads/2015/09/Brendan-Gallagher-Canadiens-Feb-2018-975x480.jpg", answer: "hockey")
image17 = Image.create(img_url: "https://www.thewrap.com/wp-content/uploads/2019/06/the-lion-king-mufasa-simba-rock.jpg", answer: "lion")
image18 = Image.create(img_url: "https://d1t80wr11ktjcz.cloudfront.net/wp-content/uploads/2018/07/01053742/7138002.jpg?d=900x474&q=70", answer: "james bond")
image19 = Image.create(img_url: "https://www.simplyrecipes.com/wp-content/uploads/2019/09/IP-Chicken-Wing-Ramen-LEAD-4.jpg", answer: "ramen")
image20 = Image.create(img_url: "https://inteng-storage.s3.amazonaws.com/images/MARCH/sizes/Clippy-Clip_md.jpg", answer: "clippy")
image21 = Image.create(img_url: "https://i.imgur.com/p1sLrmF.jpg", answer: "yoan")
image22 = Image.create(img_url: "https://i.imgur.com/2pIYW5f.png", answer: "xxreddarknessxx")


                
                
