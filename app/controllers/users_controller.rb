class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
  before_action :require_admin, only: [:admin_edit_all, :admin_update_all]

  def index
    @users = User.all
    render :index
  end

  def admin_new
    if User.admins.count == 0
      @user = User.new
      render 'admin_new'
    else 
      flash[:errors] = ["We already have admins! No new admins necessary."]
      redirect_to login_path
    end
  end

  def admin_create
    @user = User.new user_params
    @user.admin = true
    if @user.save
      session[:user_id] = @user.id
      redirect_to admin_home_path
    else 
      flash[:errors] = ["Failed to create an admin."]
      redirect_to admin_new_path
    end
  end

  def new
    if @logged_in_user
      flash[:errors] = ["You are already logged in! You do not need to sign up"]
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notifications] = ["You've logged in successfully"]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notifications] = ["UPDATED"]
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def admin_edit_all
    @users = User.order(admin: :desc)
  end

  def admin_update_all
    @users = User.order(admin: :desc)
    @users.each do |user|
      user.admin = params[:users]["#{user.id}"][:admin] 
      user.save
    end

    redirect_to admin_edit_all_users_path
  end

  def destroy
    @user.destroy
    flash[:notifications] = ["User destroyed successfully."]
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :avatar_url)
  end

    
end
