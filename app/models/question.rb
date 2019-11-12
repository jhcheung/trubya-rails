class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['answer'].blank? }

  def generate_with_trivia_api(api_question) 
    self.question = api_question["question"] 
    self.save
    correct_answer = self.answers.build answer: api_question["correct_answer"], correct?: true
    correct_answer.save
    api_question["incorrect_answers"].each do |answer|
      wrong_answer = self.answers.build answer: answer, correct?: false
      wrong_answer.save
    end
    question
  end
end
