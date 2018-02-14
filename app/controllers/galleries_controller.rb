class GalleriesController < ApplicationController

  before_action :require_login, only: [:index, :new, :create, :edit, :update, :destroy, :show, :imagelike]

  before_action :set_gallery, only: [:edit, :update, :show, :imagelike]

  before_action :require_same_user, only: [:edit, :update]

  def index
    @images = Gallery.all
    #@toFollow = User.all.last(5)
  end

  def show
    @i = Gallery.find(params[:id])
    #@toFollow = User.all.last(5)
  end

  def new
    @image = Gallery.new
  end

  def create
    @image = Gallery.new(gallery_params)
    @image.user_id = current_user.id
    respond_to do |f|
      if(@image.save)
        f.html {redirect_to "/galleries", notice: "Image uploaded!"}
      else
        f.html {redirect_to "/galleries/new", notice: "Error: image not uploaded!"}
      end
    end
  end

  def edit
    @image = Gallery.find(params[:id])
  end

  def update
    @image = Gallery.find(params[:id])
    if @image.update(gallery_params)
      redirect_to gallery_path(@image)
    else
      render :edit
    end 
  end

  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to galleries_path
  end


  def imagelike
    @i = Gallery.find(params[:id])
    @imagelike = Imagelike.create(imagelike: params[:imagelike], user: current_user, gallery: @i)

    respond_to do |format| 
    if @imagelike.valid?
      
        format.html
        format.js
    else
      
        format.html
        format.js
      end
    end
  end


  private
    def gallery_params #allows certain data to be passed via form
      params.require(:gallery).permit(:user_id, :title, :content, :gallery_image)
    end

    def set_gallery
      @image = Gallery.find(params[:id])
    end

    def require_same_user
      if current_user != @image.user and !current_user.admin?
          redirect_to galleries_path
      end
    end

    def require_login
      if !user_signed_in?
          redirect_to root_path
      end
    end

end
