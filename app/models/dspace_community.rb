require 'dspace'

class DspaceCommunity < Dspace::Community
  include ActiveModel::Model

  def self.all(limit=25,offset=0)
    DspaceService.client.communities.all(limit: limit, offset: offset)
  end

  def self.find(id, expand="")
    DspaceService.client.communities.find(id: id, expand: expand)
  end

  def self.save(args)
    DspaceService.client.communities.create(Dspace::Community.new(args))
  end

  def self.update(args, id)
    DspaceService.client.communities.update(Dspace::Community.new(args), id: id)
  end

  def self.destroy(id)
    DspaceService.client.communities.delete(id: id)
  end

end
