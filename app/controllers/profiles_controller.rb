class ProfilesController < ApplicationController

  def index
    @profiles = Profile.where("videoconfavailability <= ? AND videoconfavailability >= ?", Time.now + 1.hour , Time.now - 1.hour )
    @suggest = Profile.where(:videoconfavailability =>  Time.now..Time.now.end_of_day)
      respond_to do |format|
        format.html{}
        format.js{}
      end
  end


  def edit
    @profile = Profile.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @profile = Profile.find(params[:id])
    @user = User.find(params[:user_id])
    if @profile.update_attributes(profile_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

private

  def profile_params
    params.require(:profile).permit(:user_id, :availability,:videoconfavailability)
  end


end
