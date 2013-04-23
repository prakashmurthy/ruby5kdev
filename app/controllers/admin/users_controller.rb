class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all( :order => :email )
  end

  def show
    @user = User.find( params[:id] )
  end
end
