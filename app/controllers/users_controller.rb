class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_pictures = Picture.where("user_id = ?", (params[:id]))
  end

  def favorite_index
    @user = User.find(params[:id])
    @favorites_pictures = @user.favorite_pictures
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
