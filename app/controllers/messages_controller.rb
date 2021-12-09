class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :count
  def index
    @building = current_user.building

    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.building = current_user.building
    @message.user = current_user

    if @message.save
      BuildingChannel.broadcast_to(
        current_user.building,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to messages_path(BuildingChannel, anchor: "message-#{@message.id}")
    else
      @building = current_user.building
      render :index
    end
  end

  def count
    @count = Message.count

    render json: @count
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
