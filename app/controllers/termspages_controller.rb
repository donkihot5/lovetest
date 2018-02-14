class TermspagesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy, :like]
  
  def index
    @terms = Termspage.all
  end

  def show
  end

  def new
     @term = Termspage.new
  end

  def create
    @term = Termspage.new(term_params)
    @term.user_id = current_user.id
    respond_to do |f|
      if(@term.save)
        f.html {redirect_to "/termspages", notice: "Term created!"}
      else
        f.html {redirect_to "/termspages/new", notice: "Error: Term not saved!"}
      end
    end
  end

  def edit
    @term = Termspage.find(params[:id])
  end

  def update
    @term = Termspage.find(params[:id])
    if @term.update(term_params)
      redirect_to termspages_path
    else
      render :edit
    end 
  end

  def destroy
    Termspage.find(params[:id]).destroy
    redirect_to termspages_path
  end

  private

    def term_params #allows certain data to be passed via form
      params.require(:termspage).permit(:user_id, :title, :content)
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
