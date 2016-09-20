require 'dspace'

class DspaceCommunity < Dspace::Community
  include ActiveModel::Model

  def self.all(limit=25,offset=0)
    DspaceService.client.communities.all(limit: limit, offset: offset)
  end

  def self.find(id, expand="")
    DspaceService.client.communities.find(id: id, expand: expand.delete(' '))
  end

  def self.save(args)
    if args['parent_community'].empty?
      DspaceService.client.communities.create(
        Dspace::Community.new(args)
      )
    else
      DspaceService.client.communities.create_subcommunity(
        Dspace::Community.new(args),
        id: args['parent_community']
      )
    end
  end

  def self.update(args, id)
    DspaceService.client.communities.update(Dspace::Community.new(args), id: id)
  end

  def self.destroy(id)
    DspaceService.client.communities.delete(id: id)
  end

end
