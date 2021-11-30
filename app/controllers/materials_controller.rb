class MaterialsController < ApplicationController
  def index
    @materials = Material.all
    @building = Building.find(2)
  end

  def show
    @material = Material.find(params[:id])
    @building = Building.find(2)
  end

  def new
    @material = Material.new
    @building = Building.find(2)
  end

  def create
    @material = Material.new(material_params)
    @material.user = current_user
    @material.available = true
    @building = Building.find(2)
    @material.building = @building

    if @material.save!
      redirect_to building_materials_path(@building)
    else
      render :new
    end
  end

  def edit
    @material = Material.find(params[:id])
    @building = Building.find(2)
  end

  def update
    @building = Building.find(2)
    @material = Material.find(params[:id])
    @material.update(material_params)
    redirect_to building_materials_path(@building)
  end

  def destroy
    @building = Building.find(2)
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
