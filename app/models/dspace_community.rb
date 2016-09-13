require 'dspace'

class DspaceCommunity < Dspace::Community
  include ActiveModel::Model

  def self.all(limit=25,offset=0)
    ::DspaceClient.communities.all(limit: limit, offset: offset)
  end

  def self.find(id)
    ::DspaceClient.communities.find(id: id, expand: 'collections')
  end

  def self.save(args)
    ::DspaceClient.communities.create(Dspace::Community.new(args))
  end

  def self.update(args, id)
    ::DspaceClient.communities.update(Dspace::Community.new(args), id: id)
  end

  def self.destroy(id)
    ::DspaceClient.communities.delete(id: id)
  end

end
