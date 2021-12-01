class MessagesController < ApplicationController
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
      redirect_to messages_path
    else
      render :new
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
