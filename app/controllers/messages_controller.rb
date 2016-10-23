class MessagesController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
  end

  def new
    @message = Message.new({sender_id: current_user.id})
    @friends = current_user.friends
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @friends = current_user.friends

    if @message.save
      flash[:success] = 'Message sent successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Unable to save message.'
      render 'new'
    end

  end

  private
  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end
end
