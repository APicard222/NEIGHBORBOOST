class DemandsController < ApplicationController
  def index
    @building = Building.find(1)
    @demands =  Demand.all
  end

  def new
    @demand = Demand.new
  end

  def create
    @demand = Demand.new(demand_params)
  end

  private

  def demand_params
    params.require(:demand).permit(:title, :description, :category, :start_date, :end_date)
  end
end
