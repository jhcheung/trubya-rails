class Topic < ApplicationRecord
    has_many :questions
    has_many :games

    def self.order_by_id
        self.all.sort_by { |topic| topic.id }
    end

    def self.only_enabled
        self.where(enabled: true).sort_by { |topic| topic.id }
    end

    def random_question
        self.questions.sample
    end
end
