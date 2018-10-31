class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :loggin_cheack, only: [:new, :edit, :show, :destroy]

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      PictureMailer.picture_mail(@picture).deliver
      redirect_to pictures_path, notice: '投稿しました！'
    else
      render 'new'
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    unless @picture.user_id == current_user.id
      redirect_to root_path, notice: '自分の投稿以外は編集できません'
    end
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

  def destroy
    unless @picture.user_id == current_user.id
      redirect_to root_path, notice: '自分の投稿以外は削除できません'
    else
      @picture.destroy
      redirect_to pictures_path, notice: '投稿を削除しました'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def loggin_cheack
    unless current_user
      flash[:referer] = 'ログインしてください'
      render new_session_path
    end
  end
end
