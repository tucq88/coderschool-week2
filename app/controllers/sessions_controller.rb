class SessionsController < ApplicationController

  # show login
  def new
    @user = User.new
  end

  # do login
  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Login successfully!'
        redirect_to root_path
      else
        flash[:error] = 'Incorrect password'
        render 'new'
      end
    else
      flash[:error] = 'User not found with email ' + params[:email]
      render 'new'
    end
  end

  # do logout
  def destroy

  end

  private
  def session_params
    params.require(:user).premit(:email, :password)
  end

end
