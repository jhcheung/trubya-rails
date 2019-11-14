class GamesController < ApplicationController
    before_action :set_game, only: [:play, :playing, :edit, :update, :show]
    before_action :require_admin, only: [:index]

    def index
        @games = Game.all
    end

    def new
        if Image.unused_random_image(@logged_in_user)
            @game = Game.new
            render 'new'
        else 
            flash[:errors] = ["You have already played with all images!"]
            redirect_to root_path
        end
    end

    def create
        @game = Game.new user: @logged_in_user, image: Image.unused_random_image(@logged_in_user), topic_id: params[:game][:topic_id], score: 0
        if @game.save
            session[:lives] = 10
            redirect_to play_game_path @game
        else 
            flash[:errors] = ["You have already played with all images!"]
            redirect_to root_path
        end
    end

    def play
        require_current_user_or_admin
        @image = @game.image
        if session[:question_id]
            @question = Question.find(session[:question_id])   
        else
            @question = @game.topic.random_question
            session[:question_id] = @question.id
        end
    end 

    def playing
        require_current_user_or_admin
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

        redirect_to play_game_path @game
    end


    def edit
        
    end

    def update
        
    end

    def show
        
    end

    private

    def set_game
        @game = Game.find params[:id]
    end

    def require_current_user_or_admin
        unless (@logged_in_user && @logged_in_user == @game.user) || (@logged_in_user && @logged_in_user.admin)
            redirect_to forbidden_path  
        end
    end

end
