class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :authenticate_user!, except: :show

  def edit
  end

  def	update
    if	@user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @targets = @user.targets
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
