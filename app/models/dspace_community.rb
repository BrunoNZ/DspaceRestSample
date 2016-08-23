require 'dspace'

class DspaceCommunity < Dspace::Community
  include ActiveModel::Model

  def self.all
    dspace_client.communities.all
  end

  def self.find id
    dspace_client.communities.find(id: id, expand: 'collections')
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end
end
