class Topic < ApplicationRecord
    has_many :questions
    has_many :games
end
