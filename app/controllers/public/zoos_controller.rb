class Public::ZoosController < ApplicationController

  def index
    if params[:name].present?
      @zoos = Zoo.where(name: params[:name])
    else
      @zoos = Zoo.all
    end
  end

  def show
    @zoo = Zoo.find(params[:id])
    @zoo_animals = ZooAnimal.where(zoo_id: @zoo.id)
  end

  def search
    @zoos = Zoo.search_for(params[:word])
  end

end
