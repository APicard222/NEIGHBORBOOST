class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.user = current_user
    @material.available = true

    if @material.save
      redirect_to materials_path
    else
      render :new
    end
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    @material.update(material_params)
    redirect_to materials_path
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy

    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:title, :description)
  end
end
