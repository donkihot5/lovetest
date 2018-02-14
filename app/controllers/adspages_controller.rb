class AdspagesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy, :like]

  def index
    @ads = Adspage.all
  end

  def show
  end

  def new
    @ad = Adspage.new
  end

  def create
    @ad = Adspage.new(ads_params)
    @ad.user_id = current_user.id
    respond_to do |f|
      if(@ad.save)
        f.html {redirect_to "/adspages", notice: "Ad created!"}
      else
        f.html {redirect_to "/adspages/new", notice: "Error: Ad not saved!"}
      end
    end
  end

  def edit
    @ad = Adspage.find(params[:id])
  end

  def update
    @ad = Adspage.find(params[:id])
    if @ad.update(ads_params)
      redirect_to adspages_path(@ad)
    else
      render :edit
    end 
  end

  def destroy
    Adspage.find(params[:id]).destroy
    redirect_to adspages_path
  end

  private

    def ads_params #allows certain data to be passed via form
      params.require(:adspage).permit(:user_id, :title, :content)
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
