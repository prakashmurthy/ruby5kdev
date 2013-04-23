class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all( :order => :email )
  end

  def show
    @user = User.find( params[:id] )
  end

  def new
    @user = User.new
  end

  def create
    is_admin = params[:user].delete(:admin) == "1"
    @user = User.new(params[:user])
    @user.admin = is_admin
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => :new
    end
  end
end
