class Leaderboard < ApplicationRecord
    has_many :placings
    has_many :users, through: :placings
end
