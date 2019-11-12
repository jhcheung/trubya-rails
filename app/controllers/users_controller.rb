class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "SUCCESS"
      redirect_to home_path
    else
      flash[:messages] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "UPDATED"
      redirect_to user_path(@user)
    else
      flash[:messages] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def delete
    render :delete
  end

  def destroy
    @user.destroy
    flash[:notice] = "Page destroyed successfully."
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name)
  end

  
    
end
