class TargetsController < ApplicationController
  def index
    @targets = Target.includes(:user)
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def target_params
    params.require(:target).permit(:content).merge(user_id: current_user)
  end

end
