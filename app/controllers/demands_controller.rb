class DemandsController < ApplicationController
  # before_action :new, :create

  def index
    @building = Building.find(current_user.building.id)
    @demands = Demand.all
  end

  def new
    @building = Building.find(current_user.building.id)
    @demand = Demand.new
  end

  def create
    @building = Building.find(current_user.building.id)
    @demand = Demand.new(demand_params)
    @demand.building = @building
    @demand.requester_id = current_user.id

    if @demand.save!
      redirect_to building_demands_path(@building)
    else
      render :new
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:title, :description, :category, :start_date, :end_date)
  end
end
