class ImagesController < ApplicationController
  def index
    @image = Image.new
    if params[:images_type] == "hidden"
      @images = current_user.images.hidden
    else
      @images = current_user.images.shown
    end
    render :layout => false
  end

  def create
    @image = Image.new(params[:image])
    @image.user = current_user
    if @image.save
      redirect_to images_path
    else 
      render :action => :index
    end
  end

  def update_images
    images = Image.find(params[:hidden])
    images.each do |image|  
      image.update_attribute :hidden, !image.hidden? 
    end
    redirect_to images_path
  end

end
