class TargetsController < ApplicationController
  before_action:set_target, only: [:show, :destroy]

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

  def show
  end

  def destroy
    @target.destroy
    redirect_to root_path
  end

  def memo
    
  end

  private
  def target_params
    params.require(:target).permit(:content).merge(user_id: current_user.id)
  end

  def set_target
    @target = Target.find(params[:id])
  end

end