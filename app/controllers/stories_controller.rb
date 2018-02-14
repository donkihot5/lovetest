class StoriesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :like]

  before_action :set_story, only: [:edit, :update, :show, :like]

  before_action :require_same_user, only: [:edit, :update]

  def index
    @stories = Story.all
    @trendstories = Story.all.last(5)
  end

  def show
    @story = Story.find(params[:id])
    #created a story object which can be used on view for the story page
    #@toFollow = User.all.last(5)
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    respond_to do |f|
      if(@story.save)
        f.html {redirect_to "/stories", notice: "Story created!"}
      else
        f.html {redirect_to "/stories/new", notice: "Error: Story not saved!"}
      end
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to story_path(@story)
    else
      render :edit
    end        
  end

  def destroy
    Story.find(params[:id]).destroy
    redirect_to stories_path
  end

  private
    def story_params #allows certain data to be passed via form
      params.require(:story).permit(:user_id, :title, :content, :story_image)
    end

    def set_story
      @story = Story.find(params[:id])
    end

    def require_same_user
      if current_user != @story.user and !current_user.admin?
          redirect_to stories_path
      end
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
