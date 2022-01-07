class BlockedUsersController < ApplicationController

  def index 
    @blocked_users = current_user.blocked
  end 

end
