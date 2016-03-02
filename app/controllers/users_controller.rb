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
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to(:users, notice: 'Member was successfully created')
      elsif
        @user.student?
        redirect_to new_user_url(tutor:true)
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


    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation, :student,
            profile_attributes:[:category, :qualification, :location, :picture, :availability])

  end

end
