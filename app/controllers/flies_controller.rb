class FliesController < ApplicationController
  before_action :set_user
  before_action :set_fly, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  before_action :ensure_current_user, only: [:new, :create]

  def index
    @flies = Fly.where(user_id: @user.id)
  end

  def show
  end

  def new
    @fly = @user.flies.new
  end

  def create
    @fly = @user.flies.new(fly_params)
    if @fly.save
      redirect_to user_flies_path, notice: 'fly successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @fly.update(fly_params)
      redirect_to fly_path(@fly), notice: 'fly was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @fly.destroy
    redirect_to user_flies_path, notice: 'fly was successfully deleted.'
  end

private

  def fly_params
    params.require(:fly).permit(:name, :classification, :user_id)
  end

  def set_fly
    @fly = Fly.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def ensure_current_user
    unless current_user.id == params[:user_id]
      raise AccessDenied
    end
  end
end
