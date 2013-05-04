class UsersController < ApplicationController
  def index
    @users = User.order( "created_at DESC" )
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile has been updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Profile has not been updated."
      render :action => :edit
    end
  end
end
