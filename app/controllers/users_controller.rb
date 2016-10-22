class UsersController < ApplicationController

  # signup form
  def new
      @user = User.new
  end

  # do signup
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User registered successfully'
      # TODO Sent confirmation email
      redirect_to root_path
    else
      flash[:error] = 'Invalid data. Check your inputs'
      session[:user_id] = @user.id
      render 'new'
    end
  end

  # list of users
  def index
    @users = User.where.not(id: current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
