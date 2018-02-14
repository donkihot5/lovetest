class AdminsController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_username(params[:id])
  end

  def new
    @newUser = User.new
  end

  def create
  end

  def edit
    @user = User.find_by_username(params[:id])
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
