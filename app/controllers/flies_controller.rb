class FliesController < ApplicationController
  before_action :set_fly, only: [:show, :edit, :update, :destroy]
  def index
    @flies = Fly.all
  end

  def show
  end

  def new
    @fly = Fly.new
  end

  def create
    fly = Fly.new(fly_params)
    fly.save
    redirect_to flies_path, notice: 'fly successfully created.'
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
    redirect_to flies_path, notice: 'fly was successfully deleted.'
  end

private

  def fly_params
    params.require(:fly).permit(:name, :classification)
  end

  def set_fly
    @fly = Fly.find(params[:id])
  end

end
