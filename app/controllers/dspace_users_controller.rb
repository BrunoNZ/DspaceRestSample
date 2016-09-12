class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users/login
  def show
  end

  # GET /users/login
  def login
  end

  # POST /users/login_action
  def login_action
    respond_to do |format|
      if User.login(user_params)
        format.html { redirect_to users_show_path,
          notice: 'Welcome! You have signed up successfully.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :login }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # POST /users/logout_action
  def logout_action
    User.logout
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.current_status
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
