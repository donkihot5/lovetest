class AdminstoriesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]
  
  def index
  end

  def show
    @stories = Story.all.where("user_id = ?", User.find_by_username(params[:id]))
    #@toFollow = User.all.last(5)
    @trendstories = Story.all.last(5)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def admin_user
      redirect_to posts_path unless current_user.admin?
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
