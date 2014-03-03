class StaticPagesController < ApplicationController
  
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def faq 
  end

  def about
  end
  
  def contact
  end
  
  def map
    @title = "Map"
    @encounters = Encounter.find(:all)
    @hash = Gmaps4rails.build_markers(@encounters) do |e, marker|
      marker.lat e.latitude
      marker.lng e.longitude
      marker.infowindow User.find_by(id: e.user1_id).name + " encounter " + User.find_by(id: e.user2_id).name + " at " + e.address
    end
  end
end
