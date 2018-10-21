class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '投稿しました！'
    else
      render 'edit'
    end
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

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
