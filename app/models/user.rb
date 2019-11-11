class User < ApplicationRecord
    has_many :games
    has_many :topics, through: :games
    
    has_many :images, through: :games
    has_many :questions, through: :topics
end
