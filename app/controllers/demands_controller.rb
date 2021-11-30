class DemandsController < ApplicationController
  # before_action :new, :create

  def index
    @demands = current_user.building.demands
    @demand = Demand.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'demands/add_demand_card', locals: { demands: @demand }, formats: [:html] }
    end
  end

  def create
    @demand = Demand.new(demand_params)
    @demand.building = current_user.building
    @demand.requester_id = current_user.id

    if @demand.save
      redirect_to demands_path
    else
      render :new
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:title, :description, :category, :start_date, :end_date)
  end
end
