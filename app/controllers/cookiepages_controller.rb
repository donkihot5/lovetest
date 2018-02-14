class CookiepagesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy, :like]

  def index
    @cookies = Cookiepage.all
  end

  def show
  end

  def new
    @cook = Cookiepage.new
  end

  def create
    @cook = Cookiepage.new(cookie_params)
    @cook.user_id = current_user.id
    respond_to do |f|
      if(@cook.save)
        f.html {redirect_to "/cookiepages", notice: "Cookie created!"}
      else
        f.html {redirect_to "/cookiepages/new", notice: "Error: Cookie not saved!"}
      end
    end
  end

  def edit
    @cook = Cookiepage.find(params[:id])
  end

  def update
    @cook = Cookiepage.find(params[:id])
    if @cook.update(cookie_params)
      redirect_to cookiepages_path(@cook)
    else
      render :edit
    end 
  end

  def destroy
    Cookiepage.find(params[:id]).destroy
    redirect_to cookiepages_path
  end

  private

    def cookie_params #allows certain data to be passed via form
      params.require(:cookiepage).permit(:user_id, :title, :content)
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
