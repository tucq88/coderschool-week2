class HomeController < ApplicationController
  helper ApplicationHelper

  def index
    render session[:user_id] ? 'auth' : 'public'
  end

  def public
  end

  def auth
  end

end
