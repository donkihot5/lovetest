class UsersController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :imagelike]

  def index
    #grab the username from the url as id, still do not understand this, but /user/id works with index, /users/id with show 
    @users = User.all
    #adding the relation to the song on users page index to allow them to post new song...    
    
    @newSong = Song.new
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found!"
    end
    @songs = Song.all.where("user_id = ?", User.find_by_username(params[:id]).id )

    @stories = Story.all.where("user_id = ?", User.find_by_username(params[:id]).id )

    @toFollow = User.all.last(5)

    @trendstories = Story.all.last(5)

    @trendsongs = Song.all.last(5)
  end

  def show
    @users = User.all
    @newSong = Song.new
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found!"
    end
    @songs = Song.all.where("user_id = ?", User.find_by_username(params[:id]).id )

    @toFollow = User.all.last(5)

    @trendstories = Story.all.last(5)

    @trendsongs = Song.all.last(5)
  end

  def new
    @newSong = Song.new
    @u = User.new
  end

  def create
    @u = User.new(users_params)
    #@song.user_id = current_user.id
    respond_to do |f|
      if(@u.save)
        f.html {redirect_to "/admins", notice: "User created!"}
      else
        f.html {redirect_to "", notice: "Error: user not saved!"}
      end
    end
  end

  def edit
    @user = User.find_by_username(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(users_params)
        format.html {redirect_to admins_path}
      else
        render :edit
      end
    end  
  end

  def destroy
    User.find_by_username(params[:id]).destroy
    redirect_to admins_path
  end

  private
  def users_params #allows certain data to be passed via form
    params.require(:user).permit(:user_id, :username, :password, :description, :email, :user_image, :profile_image, :password_confirmation, :remember_me)
  end

  def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
