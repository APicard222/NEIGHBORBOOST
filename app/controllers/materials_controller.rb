class MaterialsController < ApplicationController

  def index
    @materials = Material.where.not(user: current_user)
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
    @material.building = current_user.building

    if @material.save!
      redirect_to dashboard_users_path
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
    redirect_to material_path(@material)
  end

  def destroy
    @material = Material.find(params[:id])
    @material.building = current_user.building
    @material.destroy
    redirect_to dashboard_users_path
  end

  private

  def material_params
    params.require(:material).permit(:title, :description, :photo)
  end
end
