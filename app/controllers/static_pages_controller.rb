class StaticPagesController < ApplicationController
  #get /
  def home
    @user=currentuser
    @ricerche=Ricerche.new
    if !@user.nil?
      @servizi = currentuser.servizis.build if logged_in?
      @serviziutente = currentuser.feed.paginate(page: params[:page])
      @servizifollowing = currentuser.feedfollowing.paginate(page: params[:page]) if logged_in?
    end
  end
  def help
  end

  def about
  end
end
