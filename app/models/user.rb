class User < ApplicationRecord
    has_many :games
    has_many :topics, through: :games
    
    has_many :images, through: :games
    has_many :questions, through: :topics
    
    has_secure_password

    def to_s
        self.first_name + " " + self.last_name
    end

    def self.admins
        self.where admin:true
    end

    def won_games
        self.games.select { |game| game.winner == true }
    end

    def won_images
        self.won_games.map { |game| game.image }
    end
end
