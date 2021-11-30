class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
  def dashboard
    @building = Building.find(current_user.building.id)
    @materials = Material.where(user_id: current_user)
    @demands = Demand.where(requester_id: current_user)
    @acceptances = Demand.where(responder_id: current_user)
  end
end
