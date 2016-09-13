require 'dspace'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  private

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def set_current_user
    DspaceService.client.access_token = session[:dspace_access_token]
    @_current_user ||= DspaceUser.current_status
  end
end
