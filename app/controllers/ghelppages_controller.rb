class GhelppagesController < ApplicationController

	before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :show, :imagelike]

  def index
  	@helps = Helppage.all
  end

  private

  def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
