class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :destroy, :edit, :update]
    before_action :require_admin
    
    def index
        @questions = Question.all
    end

    def show

    end

    def random
        if flash[:question_ids]
            @questions = []
            flash[:question_ids].each do |qid|
                question = Question.find(qid)
                @questions << question
            end
        end
    end

    def random_create
        trivia_api = TriviaApi.new
        trivia_api.change_category params[:category_id]
        topic = Topic.find_by(category_id: params[:category_id])
        flash[:question_ids] = []
        params[:number].to_i.times do
            question = trivia_api.get_random_question
            @question = topic.questions.build
            @question = @question.generate_with_trivia_api(question)
            flash[:question_ids] << @question.id
        end
        redirect_to questions_random_path
    end

    def new
        @question = Question.new
        4.times do
            @question.answers.build
        end 
    end

    def create
        @question = Question.create questions_params
    end

    def destroy
        @question.destroy
        
        redirect_to questions_path
    end

    def edit
        
    end

    def update
        @question.update question_params
    end

    private

    def set_question
        @question = Question.find params[:id]
    end

    def question_params
        params.require(:question).permit(:question, :topic_id, answer_attributes: [ :answer, :correct ])
    end

end
