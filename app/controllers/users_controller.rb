class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers, :block, :unblock]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    @blocked_users = @current_user.blocked
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def block
    if request.get?
      render "blocked_users/block_user_form"
    else
      @blocked = "Blocked"
      @user_to_block = User.find(params[:id])
      if @current_user.blocked.include?(@user_to_block)
        flash[:error] = "User is already blocked"
      else
        @current_user.block(@user_to_block, params[:reason]) 
        if @current_user.save
          flash[:success] = "Blocked user successfully"
        else
          flash[:error] = "Failed to block user"
        end
      end
      redirect_to users_url
    end
  end

  def unblock
    @user_to_unblock = User.find(params[:id])
    if @current_user.blocked.include?(@user_to_unblock)
      @current_user.blocked.delete(@user_to_unblock)
      if @current_user.save 
        flash[:success] = "User unblocked"
      else 
        flash[:error] = "Failed to unblock user"
      end
    end
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
