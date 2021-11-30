class DemandsController < ApplicationController
  # before_action :new, :create

  def index
    @building = Building.find(current_user.building.id)
    @demands = Demand.all
    @demand = Demand.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'demands/add_demand_card', locals: { demands: @demand }, formats: [:html] }
    end
  end

  def show
    @demand = Demand.find(params[:id])
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'demands/show_demand', locals: { demand: @demand }, formats: [:html] }
    end
  end

  def create
    @building = Building.find(current_user.building.id)
    @demand = Demand.new(demand_params)
    @demand.building = @building
    @demand.requester_id = current_user.id

    if @demand.save
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
