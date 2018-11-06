class RelationshipsController < ApplicationController
   def create
	@user = User.find(params[:followed_id])
    @cuser=currentuser
    currentuser.follow(@user)
	respond_to do |format|
           format.html { redirect_to @user }
	       format.js
        end
   end
     def destroy
          @user = Relationship.find(params[:id]).followed
         currentuser.unfollow(@user)
         @cuser=currentuser
 	     respond_to do |format|
           format.html { redirect_to @user }
	       format.js
	end
  end
end
