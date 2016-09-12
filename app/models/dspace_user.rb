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
    DspaceUser.new(JSON.parse(dspace_client.status))
  end

  def self.login(args)
    if dspace_client.login args['email'], args['password'] then
      return true
    end
    return false
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end

end
