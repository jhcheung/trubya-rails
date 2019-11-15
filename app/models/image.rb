class Image < ApplicationRecord
    has_many :games, dependent: :destroy
    has_many :users, through: :games

    # def self.random_image
    #     self.all.sample
    # end

    def winning_games
        self.games.select { |game| game.winner == true }
    end

    def self.unused_image(user)
        self.all.select { |image| !user.won_images.include? image }
    end

    def self.unused_random_image(user)
        self.unused_image(user).sample
    end
end
