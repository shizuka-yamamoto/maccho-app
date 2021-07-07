class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :authenticate_user!, except: :index

  def edit
  end

  def	update
    if @user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
    @targets = @user.targets.order('created_at DESC')
    @reviews = @user.reviews.order('created_at DESC')
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
