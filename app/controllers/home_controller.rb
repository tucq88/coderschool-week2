class HomeController < ApplicationController
  helper ApplicationHelper

  def index
    render current_user ? 'auth' : 'public'
  end

  def public
  end

  def auth
  end

end
