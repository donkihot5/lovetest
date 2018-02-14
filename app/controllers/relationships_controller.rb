class RelationshipsController < ApplicationController

  respond_to :js, :json, :html

  def create
  		user = User.find(params[:followed_id])
      @follow = current_user.follow(user)

  end

  def destroy
  		user = Relationship.find(params[:id]).followed 
      @unfollow = current_user.unfollow(user)

  end

end
