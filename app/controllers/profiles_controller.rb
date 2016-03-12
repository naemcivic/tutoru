class ProfilesController < ApplicationController
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
    params.require(:profile).permit(:user_id, :availability)
  end


end
