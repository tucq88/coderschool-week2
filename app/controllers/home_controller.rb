class HomeController < ApplicationController

  def index
    if current_user

      @messages = current_user.recent_messages
      @new_users = current_user.recent_non_friends

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
