class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @materials = Material.where(user_id: current_user)
    @demands = Demand.where(requester_id: current_user)
    @acceptances = Demand.where(responder_id: current_user)
    @material = Material.new
    @bookings = Booking.where(booker_id: current_user).order('start_time ASC')
    @booking = Booking.exists?(booker_id: current_user)
  end

  def my_materials
    @materials = Material.where(user_id: current_user)
    @material = Material.new
  end

  def my_demands
    @demands = Demand.where(requester_id: current_user)
    @demand = Demand.new
    @acceptances = Demand.where(responder_id: current_user)
  end
end
