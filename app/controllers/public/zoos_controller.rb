class Public::ZoosController < ApplicationController

  def index
    if params[:region].present?
      @zoos = Zoo.where("region LIKE ?", "%#{params[:region]}%")
    else
      @zoos = Zoo.all
    end
  end

  def show
    @zoo = Zoo.find(params[:id])
    @zoo_animals = ZooAnimal.where(zoo_id: @zoo.id)
  end

end
