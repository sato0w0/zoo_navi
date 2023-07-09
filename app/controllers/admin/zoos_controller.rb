class Admin::ZoosController < ApplicationController

  def index
    @zoos = Zoo.all
  end

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new(zoo_params)
    if @zoo.save
      redirect_to admin_zoo_path(@zoo)
    else
      render :new
    end
  end

  def show
    @zoo = Zoo.find(params[:id])
    @animals = @zoo.animals
  end

  def edit
    @zoo = Zoo.find(params[:id])
  end

  def update
    @zoo = Zoo.find(params[:id])
    if @zoo.update(zoo_params)
      redirect_to admin_zoo_path(@zoo)
    else
      render :edit
    end
  end

  private

  def zoo_params
    params.require(:zoo).permit(:image, :name, :description)
  end

end
