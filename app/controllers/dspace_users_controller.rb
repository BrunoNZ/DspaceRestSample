class DspaceUsersController < ApplicationController
  before_action :set_referer_url, only: [:login, :logout_action]
  after_action :set_dspace_access_token, only: [:login_action, :logout_action]
  after_action :clear_referer_url, only: [:login_action, :logout_action]

  # GET /users/login
  def show
  end

  # GET /users/login
  def login
  end

  # POST /users/login_action
  def login_action
    @access_token = DspaceUser.login(user_params)
    unless @access_token.nil?
      redirect_to session[:referer_url],
        notice: 'Welcome! You have signed up successfully.'
    else
      redirect_to dspace_users_login_path
    end
  end

  # DELETE /users/logout_action
  def logout_action
    if DspaceUser.logout
      @access_token = nil
      redirect_to session[:referer_url],
        notice: 'Signed out successfully.'
    else
      redirect_to dspace_users_login_path
    end

  end

  private
    def set_dspace_access_token
      session[:dspace_access_token] = @access_token
    end

    def set_referer_url
      session[:referer_url] = request.env["HTTP_REFERER"] || root_path
    end

    def clear_referer_url
      session[:referer_url] = nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
