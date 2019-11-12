class QuestionsController < ApplicationController
    
    def random

    end

    def random_create
        trivia_api = TriviaApi.new
        trivia_api.change_category params[:category_id]
        question = trivia_api.get_random_question

        topic = Topic.find_by(category_id: params[:category_id])
        flash[:question] = question 

        @question = topic.questions.build
        @question = @question.generate_with_trivia_api(question)

        redirect_to questions_random_path
    end
end
