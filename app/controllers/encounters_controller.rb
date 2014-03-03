class EncountersController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:encounter][:user2_id])
    current_user.encounter!(@user, params[:encounter][:address])
    redirect_to @user
  end

  def destroy
  end
end