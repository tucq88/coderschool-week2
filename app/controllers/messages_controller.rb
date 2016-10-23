class MessagesController < ApplicationController
  before_action :require_user!

  def index
    redirect_to root_path
  end

  def show
    @message = Message.find(params[:id])

    if current_user.id != @message.recipient_id
      flash[:error] = "Sorry, you're not allow to read this"
      redirect_to root_path
    else
      if @message.read_at == nil
        @message.read_at = Time.now
        @message.save
      else
        flash[:notice] = 'You already read this message at ' + @message.read_at.to_formatted_s(:long_ordinal)
        redirect_to root_path
      end
    end
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
