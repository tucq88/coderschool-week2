class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:success] = 'Added new friend successfully'
    else
      flash[:error] = 'Cant save data, Please have a look'
    end
    redirect_to(:back)
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."

    redirect_to(:back)
  end
end
