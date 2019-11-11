class Question < ApplicationRecord
  belongs_to :topic
  has_many :question_answers
  has_many :answers, through: :question_answers
end
