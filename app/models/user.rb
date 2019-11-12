class User < ApplicationRecord
    has_many :games
    has_many :topics, through: :games
    
    has_many :images, through: :games
    has_many :questions, through: :topics

    def to_s
        self.first_name + " " + self.last_name
    end
end
