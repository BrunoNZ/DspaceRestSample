class DspaceUsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users/login
  def show
  end

  # GET /users/login
  def login
  end

  # POST /users/login_action
  def login_action
    if DspaceUser.login(user_params)
      redirect_to dspace_users_show_path,
        notice: 'Welcome! You have signed up successfully.'
    else
      redirect_to dspace_users_login_path
    end
  end

  # DELETE /users/logout_action
  def logout_action
    if DspaceUser.logout
      redirect_to dspace_users_show_path,
        notice: 'Signed out successfully.'
    else
      redirect_to dspace_users_login_path
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = DspaceUser.current_status
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
