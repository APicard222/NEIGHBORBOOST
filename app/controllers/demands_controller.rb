class DemandsController < ApplicationController
  # before_action :new, :create

  def index
    @demands = Demand.where.not(requester_id: current_user)
    @demand = Demand.new
  end

  def show
    @demand = Demand.find(params[:id])

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'demands/show_demand', locals: { demand: @demand }, formats: [:html] }
    end
  end

  def create
    @demand = Demand.new(demand_params)
    @demand.building = current_user.building
    @demand.requester_id = current_user.id
    @demand.status = 'posted'

    if @demand.save
      redirect_to demands_path
    else
      render :new
    end
  end

  def update
    @demand = Demand.find(params[:id])
    @demand.status = params[:status]

    @demand.responder_id = current_user.id unless @demand.requester_id == current_user.id

    @demand.update(demand_params)

    @demands = current_user.id == @demand.requester_id ? Demand.where(requester_id: current_user) : Demand.where.not(requester_id: current_user)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'demands/list', locals: { demands: @demands }, formats: [:html] }
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:title, :description, :start_date, :end_date, :status)
  end
end
