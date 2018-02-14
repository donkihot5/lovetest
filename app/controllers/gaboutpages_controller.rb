class GaboutpagesController < ApplicationController

	before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :show, :imagelike]

  def index
  	@abouts = Aboutpage.all
  end

  private

  def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
