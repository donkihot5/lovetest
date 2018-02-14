class CommentsController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :find_commentable

  def index
  end

  def show
  end

  def new
    @comment = Comment.new
    #@s = Song.new(params[:song])

  end

  def create
    @comment = @commentable.comments.new comment_params

    respond_to do |f|
      if(@comment.save)
        f.html {redirect_to "/posts", notice: "Your comment was successfully posted!"}
      else
        f.html {redirect_to "", notice: "Your comment wasn't posted!"}
      end
    end
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])

    if @comment.update(comment_params)
    redirect_to @commentable, notice: "Your comment was successfully updated"
    else
    #render 'index'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Song.find_by_id(params[:song_id]) if params[:song_id]
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
