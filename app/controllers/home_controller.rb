class HomeController < ApplicationController
  helper ApplicationHelper

  def index
    if current_user

      @messages = current_user.received_messages

      console
      render 'auth'
    else
      render 'public'
    end
  end

  def public
  end

  def auth
  end

end
