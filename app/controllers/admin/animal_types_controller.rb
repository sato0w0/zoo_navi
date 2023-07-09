class Admin::AnimalTypesController < ApplicationController

  def create
    animal_type = AnimalType.new(animal_type_params)
    animal_type.save
    redirect_to admin_animal_types_path
  end

  def index
    @animal_type = AnimalType.new
    @animal_types = AnimalType.all
  end

  def edit
    @animal_type = AnimalType.find(params[:id])
  end

  def update
    animal_type = AnimalType.find(params[:id])
    if animal_type.update(animal_type_params)
      redirect_to admin_animal_types_path
    else
      render :edit
    end
  end

  private

  def animal_type_params
    params.require(:animal_type).permit(:name)
  end

end
