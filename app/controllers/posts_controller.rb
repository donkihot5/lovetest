class PostsController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  def index
    @songs = Song.all

    @stories = Story.all

    @images = Gallery.all

    @trendstories = Story.all.last(5)

    @trendsongs = Song.all.last(5)

    #@toFollow = User.all.last(5)
    #@toFollow = User.all.last(5)
    #@toFollow = User.all.last(5)
  end

  def show
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

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
