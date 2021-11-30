class MessagesController < ApplicationController
  def index
    @building = Building.find(current_user.building.id)
  end
end
