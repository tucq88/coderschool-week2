class HomeController < ApplicationController

  def index
    if current_user

      @messages = current_user.recent_messages

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
