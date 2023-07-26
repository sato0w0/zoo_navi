class Admin::ZooAnimalsController < ApplicationController
  before_action :authenticate_admin!

  def create
    zoo_animal = ZooAnimal.new(zoo_id: params[:zoo_id], animal_id: params[:animal_id])
    zoo_animal.save
    redirect_to request.referer
  end

  def destroy
    zoo_animal = ZooAnimal.find_by(zoo_id: params[:zoo_id], animal_id: params[:animal_id])
    zoo_animal.destroy
    redirect_to request.referer
  end

end
