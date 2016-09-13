require 'dspace'

class DspaceUser
  include ActiveModel::Model

  attr_reader :email, :fullname,
              :okay, :authenticated, :source_version, :api_version

  def initialize(args={})
    @email = args["email"] || ""
    @fullname = args['fullname'] || ""
    @okay = args['okay'] || false
    @authenticated = args['authenticated'] || false
    @source_version = args['sourceVersion'] || ""
    @api_version = args['apiVersion'] || ""
  end

  def self.current_status
    DspaceUser.new(DspaceService.client.status)
  end

  def self.login(args)
    begin
      access_token = DspaceService.client.login args['email'], args['password']
    rescue
      access_token = nil
    end
    access_token
  end

  def self.logout
    if DspaceService.client.logout
      return true
    end
    return false
  end

  def signed_in?
    self.authenticated
  end

end
