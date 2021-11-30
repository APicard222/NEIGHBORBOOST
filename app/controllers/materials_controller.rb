class MaterialsController < ApplicationController
  def index
    @materials = Material.where.not(user: current_user)
    @building = Building.find(current_user.building.id)
  end

  def show
    @material = Material.find(params[:id])
    @building = Building.find(current_user.building.id)
  end

  def new
    @material = Material.new
    @building = Building.find(current_user.building.id)
  end

  def create
    @material = Material.new(material_params)
    @material.user = current_user
    @material.available = true
    @building = Building.find(current_user.building.id)
    @material.building = @building

    if @material.save!
      redirect_to building_materials_path(@building)
    else
      render :new
    end
  end

  def edit
    @material = Material.find(params[:id])
    @building = Building.find(current_user.building.id)
  end

  def update
    @building = Building.find(current_user.building.id)
    @material = Material.find(params[:id])
    @material.update(material_params)
    redirect_to building_materials_path(@building)
  end

  def destroy
    @building = Building.find(current_user.building.id)
    @material = Material.find(params[:id])
    @material.building = @building
    @material.destroy
    redirect_to building_materials_path(@building)
  end

  private

  def material_params
    params.require(:material).permit(:title, :description)
  end
end
