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
    @animals = Animal.all
    @zoo_animals = ZooAnimal.where(zoo_id: @zoo.id)
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
    params.require(:zoo).permit(:image, :name, :description, :region, :address, :opening_hours, :closing_day, :admission, :telephone_number)
  end

end
