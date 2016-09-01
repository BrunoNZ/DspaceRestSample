require 'dspace'

class DspaceCollection < Dspace::Collection
  include ActiveModel::Model

  def self.all
    dspace_client.collections.all
  end

  def self.find id
    dspace_client.collections.find(id: id, expand: 'items')
  end

  def self.save(args, community_id)
    dspace_client.communities.create_collection(Dspace::Collection.new(args), id: community_id)
  end

  def self.update(args, id)
    dspace_client.collections.update(Dspace::Collection.new(args), id: id)
  end

  def self.destroy(id)
    dspace_client.collections.delete(id: id)
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end
end
