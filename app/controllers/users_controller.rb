
class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[user_params])

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_user_path, :flash => { :success => 'User was successfully updated.' }
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar)
    end
end