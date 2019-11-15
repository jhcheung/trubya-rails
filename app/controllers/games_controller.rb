class GamesController < ApplicationController
    before_action :set_game, only: [:play, :playing, :edit, :update, :show, :delete]
    before_action :require_admin, only: [:index, :show, :edit]
    before_action :require_current_user_or_admin, only: [:play, :playing]
    before_action :require_logged_in_user, only: [:new]


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
        @game = Game.new(
            user: @logged_in_user, 
            image: Image.unused_random_image(@logged_in_user), 
            topic_id: params[:game][:topic_id], 
            score: 0
        )
        if @game.save
            session[:lives] = 10
            redirect_to play_game_path @game
        else 
            flash[:errors] = ["You have already played with all images!"]
            redirect_to root_path
        end
    end

    def play
        @blocks = []

        4.times do |i|
          @blocks << []
            4.times do
              @blocks[i] << 0
            end
        end

        @image = @game.image
        if session[:question_id]
            @question = Question.find(session[:question_id])   
            @answers = @question.randomized_answers
        else
            @question = @game.topic.random_question
            @answers = @question.randomized_answers
            session[:question_id] = @question.id
        end
    end 

    def playing
        if params[:answer]
            @answer = Answer.find(params[:answer].to_i)
            if @answer.correct
                @game.score += 100
                @game.save
                if @game.score < 1000
                    flash[:notifications] = ["You have the correct answer! You have earned 100 points and now see more of the image."]
                elsif @game.score == 1000
                    flash[:notifications] = ["You have the correct answer! You have earned 100 points and have seen the full image."]

                else
                    flash[:notifications] = ["You have the correct answer! You have earned 100 points."]
                end
                session.delete :question_id
            else
                flash[:notifications] = ["Incorrect. You've lost a life. Please try again."]
                session[:lives] -= 1
                session.delete :question_id
                if session[:lives] == 0
                    flash[:notifications] = ["That was your last life! You lose."]
                    @game.winner = false
                    @game.save
                end
            end
        elsif params[:guess]
            if @game.image.answer.downcase == params[:guess].downcase
                flash[:notifications] = ["You've won!"]
                @game.winner = true
                @game.score += 1000
                @game.save
            else
                flash[:notifications] = ["Incorrect. You've lost a life. Please try again."]
                session[:lives] -= 1
                if session[:lives] == 0
                    flash[:notifications] == ["That was your last life! You lose."]
                    @game.winner = false
                    @game.save
                end
            end
        end

        redirect_to play_game_path @game
    end


    def edit
        
    end

    def update
        @game.update game_update_params

        redirect_to @game
    end

    def show
        
    end

    private

    def set_game
        @game = Game.find params[:id]
    end

    def game_update_params
        params.require(:game).permit(:winner, :score)
    end

end
