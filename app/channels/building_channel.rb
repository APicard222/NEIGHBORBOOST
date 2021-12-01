class BuildingChannel < ApplicationCable::Channel
  def subscribed
    building = Building.find(params[:id])
    stream_for building
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
