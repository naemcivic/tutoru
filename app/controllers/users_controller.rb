class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @users = Profile.where('LOWER(category) LIKE LOWER(?)', "%#{params[:search]}%").near([params[:latitude],params[:longitude]], 25, unit: :km)
      respond_to do |format|
        format.html
        format.js
      end
  end


  def show
    @appointment = @user.student_appointments.new
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
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "User info update"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to 'root'
  end

  def upvote
    @user.upvote_from current_user
    redirect_to @user
  end

  def downvote
    @user.downvote_from current_user
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation, :student,
            profile_attributes:[:category, :qualification, :location, :picture, :availability, :avatar])
  end

end
