class GamesController < ApplicationController

    def index
        @games = Game.all
    end

    def new
        if Image.unused_random_image(@logged_in_user)
            @game = Game.new
            render 'new'
        else 
            flash[:errors] = ["You have already played with all images!"]
            redirect_to home_path
        end
    end

    def create
        @game = Game.new user: @logged_in_user, image: Image.unused_random_image(@logged_in_user), topic_id: params[:game][:topic_id], score: 0
        if @game.save
            session[:lives] = 10
            redirect_to @game
        else 
            flash[:errors] = ["You have already played with all images!"]
            redirect_to home_path
        end
    end

    def update
        @game = Game.find(params[:id])
        if params[:answer]
            @answer = Answer.find(params[:answer].to_i)
            if @answer.correct
                flash[:notifications] = ["You have the correct answer! You have earned 100 points and now see more of the image."]
                @game.score += 100
                @game.save
                session.delete :question_id
                #unblur or remove css div that covers
            else
                flash[:notifications] = ["Incorrect. You've lost a life. Please try again."]
                session[:lives] -= 1
                if session[:lives] == 0
                    flash[:notifications] << "That was your last life! You lose."
                    @game.winner = false
                    @game.save
                    session.delete :question_id
                end
            end
        elsif params[:guess]
            if @game.image.answer.downcase == params[:guess].downcase
                flash[:notifications] = ["You've won!"]
                @game.winner = true
                @game.save
            else
                flash[:notifications] = ["Incorrect. You've lost a life. Please try again."]
                session[:lives] -= 1
                if session[:lives] == 0
                    flash[:notifications] << "That was your last life! You lose."
                    @game.winner = false
                end
            end
        end

        redirect_to @game
    end

    def show
        @game = Game.find params[:id]  
        @image = @game.image
        if session[:question_id]
            @question = Question.find(flash[:question_id])
        else
            @question = @game.topic.random_question
            session[:question_id] = @question.id
        end
    end

    def answer
        
    end
end
