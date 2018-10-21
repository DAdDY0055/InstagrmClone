class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to new_picture_path
  end

  def confirm
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
  end

  def index
    @pictures = Picture.all
  end

  def delete
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

end
