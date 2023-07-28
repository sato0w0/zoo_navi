class Public::AnimalsController < ApplicationController

  def index
    if params[:name].nil?
      @animals = Animal.all
    else
      @animals = AnimalType.find_by(name: params[:name]).animals
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @zoos = @animal.zoos.order(:region)
  end

end
