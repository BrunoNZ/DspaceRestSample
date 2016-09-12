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
    DspaceUser.new(JSON.parse(::DspaceClient.status))
  end

  def self.login(args)
    if ::DspaceClient.login args['email'], args['password'] then
      return true
    end
    return false
  end

  def self.signed_in?
    user = current_status
    user.authenticated
  end

end
