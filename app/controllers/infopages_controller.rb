class InfopagesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :like]

  def index
    @informations = Infopage.all
  end

  def show
    #@info = Infopage.new
  end

  def new
    @info = Infopage.new

  end

  def create
    @info = Infopage.new(info_params)
    @info.user_id = current_user.id
    respond_to do |f|
      if(@info.save)
        f.html {redirect_to "/infopages", notice: "Information created!"}
      else
        f.html {redirect_to "/infopages/new", notice: "Error: Information not saved!"}
      end
    end
  end

  def edit
    @info = Infopage.find(params[:id])
  end

  def update
    @info = Infopage.find(params[:id])
    if @info.update(info_params)
      redirect_to infopages_path
    else
      render :edit
    end 
  end

  def destroy
    Infopage.find(params[:id]).destroy
    redirect_to infopages_path
  end

  private

    def info_params #allows certain data to be passed via form
      params.require(:infopage).permit(:user_id, :title, :content)
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
