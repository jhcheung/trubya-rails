class QuestionsController < ApplicationController
    
    def random

    end

    def random_create
        trivia_api = TriviaApi.new
        trivia_api.change_category params[:category_id]
        topic = Topic.find_by(category_id: params[:category_id])
        flash[:questions] = []
        params[:number].to_i.times do
            question = trivia_api.get_random_question
            @question = topic.questions.build
            @question = @question.generate_with_trivia_api(question)
            flash[:questions] << @question 
        end
        redirect_to questions_random_path
    end
end
