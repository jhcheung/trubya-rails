class Game < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  belongs_to :image
end
