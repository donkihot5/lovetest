class HelppagesController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy, :like]

  def index
    @helps = Helppage.all
  end

  def show
  end

  def new
    @help = Helppage.new
  end

  def create
    @help = Helppage.new(help_params)
    @help.user_id = current_user.id
    respond_to do |f|
      if(@help.save)
        f.html {redirect_to "/helppages", notice: "Help created!"}
      else
        f.html {redirect_to "/helppages/new", notice: "Error: Help not saved!"}
      end
    end
  end

  def edit
    @help = Helppage.find(params[:id])
  end

  def update
    @help = Helppage.find(params[:id])
    if @help.update(help_params)
      redirect_to helppages_path(@help)
    else
      render :edit
    end 
  end

  def destroy
    Helppage.find(params[:id]).destroy
    redirect_to helppages_path
  end

  private

    def help_params #allows certain data to be passed via form
      params.require(:helppage).permit(:user_id, :title, :content)
    end

    def admin_user
      redirect_to posts_path unless current_user.admin?
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end
  
end
