class ImagecommentsController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :find_commentable

  def index
  end

  def show
  end

  def new
    @imagecomment = Imagecomment.new
    #@s = Song.new(params[:song])

  end

  def create
    @imagecomment = @commentable.imagecomments.new comment_params

    respond_to do |f|
      if(@imagecomment.save)
        f.html {redirect_to "/posts", notice: "Your imagecomment was successfully posted!"}
      else
        f.html {redirect_to "", notice: "Your imagecomment wasn't posted!"}
      end
    end
  end

  def edit
    @imagecomment = @commentable.imagecomments.find(params[:id])
  end

  def update
    @imagecomment = @commentable.imagecomments.find(params[:id])

    if @imagecomment.update(comment_params)
    redirect_to @commentable, notice: "Your imagecomment was successfully updated"
    else
    #render 'index'
    end
  end

  def destroy
    Imagecomment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

    def comment_params
      params.require(:imagecomment).permit(:content)
    end

    def find_commentable
      @commentable = Imagecomment.find_by_id(params[:imagecomment_id]) if params[:imagecomment_id]
      @commentable = Gallery.find_by_id(params[:gallery_id]) if params[:gallery_id]
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
