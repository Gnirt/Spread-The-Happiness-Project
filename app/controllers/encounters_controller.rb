class EncountersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def create
    @user = User.find(params[:encounter][:user2_id])
    @encounter = Encounter.new(:user1_id => current_user.id, :user2_id => @user.id, :address => params[:encounter][:address], :date => params[:encounter][:date])
    if @encounter.valid?
      @encounter.save!
      flash[:success] = "Encounter saved"
    else
      flash[:error] = @encounter.errors.full_messages
    end
    redirect_to @user
  end

  def destroy
    if @encounter.destroy
      flash[:success] = "Encounter removed"
    end
    redirect_to :back
  end
  
  def index
    @title = "Encounters"
    @user = User.find(params[:user_id])
    @encounters = Encounter.find(:all, :conditions => ["user1_id = ? OR user2_id = ?", @user.id, @user.id])
    @hash = Gmaps4rails.build_markers(@encounters) do |e, marker|
      marker.lat e.latitude
      marker.lng e.longitude
      marker.title User.find(e.user1_id).name + " encounter " + User.find(e.user2_id).name
      marker.infowindow e.date.to_formatted_s(:long_ordinal) + ": " + User.find(e.user1_id).name + " encounter " + User.find(e.user2_id).name + " at " + e.address
    end
  end
  
  private

    def correct_user
      @encounter = current_user.encounter.find_by(id: params[:id])
      redirect_to root_url if @encounter.nil?
    end

end