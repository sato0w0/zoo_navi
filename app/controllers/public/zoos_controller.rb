class Public::ZoosController < ApplicationController

  def index
    @zoos = Zoo.all
  end

  def show
    @zoo = Zoo.find(params[:id])
    @zoo_animals = ZooAnimal.where(zoo_id: @zoo.id)
  end

  def search
    @zoos = Zoo.search_for(params[:word])
  end

end
