class Admin::AnimalsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:name].nil?
      @animals = Animal.all
    else
      @animals = AnimalType.find_by(name: params[:name]).animals
    end
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to admin_animal_path(@animal)
    else
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to admin_animal_path(@animal)
    else
      render :edit
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:image, :name, :animal_type_id, :habitat, :body_length, :body_weight, :feature)
  end

end
