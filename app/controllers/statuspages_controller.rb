class StatuspagesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy, :like]
  
  def index
    @statuses = Statuspage.all
  end

  def show
  end

  def new
    @status = Statuspage.new
  end

  def create
    @status = Statuspage.new(status_params)
    @status.user_id = current_user.id
    respond_to do |f|
      if(@status.save)
        f.html {redirect_to "/statuspages", notice: "Status created!"}
      else
        f.html {redirect_to "/statuspages/new", notice: "Error: Status not saved!"}
      end
    end
  end

  def edit
    @status = Statuspage.find(params[:id])
  end

  def update
    @status = Statuspage.find(params[:id])
    if @status.update(status_params)
      redirect_to statuspage_path(@status)
    else
      render :edit
    end
  end

  def destroy
    Statuspage.find(params[:id]).destroy
    redirect_to statuspages_path
  end

  private

    def status_params #allows certain data to be passed via form
      params.require(:statuspage).permit(:user_id, :title, :content)
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
