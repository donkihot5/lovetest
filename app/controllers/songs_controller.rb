class SongsController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :set_song, only: [:edit, :update, :show, :like]

  before_action :require_same_user, only: [:edit, :update]

  def index
    #take all songs of the users which the current user is following

    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
    end

    @songs = Song.where("user_id IN (?)", following)

    @trendsongs = Song.all.last(5)
    #@songs = Song.all
    #@toFollow = User.all.last(5)

  end

  def show
    #@songs = Song.all
    #instead of song here is used only s in order to make it work with like/dislike options...
    @s = Song.find(params[:id])

    @trendsongs = Song.all.last(5)
    #@toFollow = User.all.last(5)
    #@u = User.find_by_username(params[:id]).id
    #@users = User.all
    #@user = User.find.where("song_id = ?", Song.find(params[:id]))
  end

  def new
    @s = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    respond_to do |f|
      if(@song.save)
        f.html {redirect_to "/posts", notice: "Song created!"}
      else
        f.html {redirect_to "", notice: "Error: song not saved!"}
      end
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end  
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to posts_path
  end

  def like
    @s = Song.find(params[:id])
    @like = Like.create(like: params[:like], user: current_user, song: @s)

    respond_to do |format| 
    if @like.valid?
        format.html
        format.js
    else
        format.html
        format.js
      end
    end
  end

  private
    def song_params #allows certain data to be passed via form
      params.require(:song).permit(:user_id, :title, :content)
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def require_same_user
      if current_user != @song.user and !current_user.admin?
          redirect_to songs_path
      end
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end


end
