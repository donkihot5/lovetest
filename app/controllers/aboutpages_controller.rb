class AboutpagesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy, :like]


  def index
    @abouts = Aboutpage.all
  end

  def show
  end

  def new
    @about = Aboutpage.new
  end

  def create
    @about = Aboutpage.new(about_params)
    @about.user_id = current_user.id
    respond_to do |f|
      if(@about.save)
        f.html {redirect_to "/aboutpages", notice: "About created!"}
      else
        f.html {redirect_to "/aboutpages/new", notice: "Error: About not saved!"}
      end
    end
  end

  def edit
    @about = Aboutpage.find(params[:id])
  end

  def update
    @about = Aboutpage.find(params[:id])
    if @about.update(about_params)
      redirect_to aboutpage_path(@about)
    else
      render :edit
    end 
  end

  def destroy
    Aboutpage.find(params[:id]).destroy
    redirect_to aboutpages_path
  end

  def guestabout
  end

  private

    def about_params #allows certain data to be passed via form
      params.require(:aboutpage).permit(:user_id, :title, :content)
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
