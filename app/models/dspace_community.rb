require 'dspace'

class DspaceCommunity < Dspace::Community
  include ActiveModel::Model

  def self.all
    dspace_client.communities.all
  end

  def self.find id
    dspace_client.communities.find(id: id, expand: 'collections')
  end

  def self.save(args)
    dspace_client.communities.create(
      Dspace::Community.new(args)
    )
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end
end
