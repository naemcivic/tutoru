class UsersController < ApplicationController

  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to(:users, notice: 'Member was successfully created')
      else
        render :new
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to user_path(@user), notice: "User info update"
      else
        render :edit
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to 'root'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :student)
  end

end
