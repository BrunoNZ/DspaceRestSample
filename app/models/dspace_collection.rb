require 'dspace'

class DspaceCollection < Dspace::Collection
  include ActiveModel::Model

  def self.all(limit=25,offset=0)
    DspaceService.client.collections.all(limit: limit, offset: offset)
  end

  def self.find(id, expand="")
    DspaceService.client.collections.find(id: id, expand: expand.delete(' '))
  end

  def self.save(args)
    DspaceService.client.communities.create_collection(
      Dspace::Collection.new(args),
      id: args['parent_community']
    )
  end

  def self.update(args, id)
    DspaceService.client.collections.update(Dspace::Collection.new(args), id: id)
  end

  def self.destroy(id)
    DspaceService.client.collections.delete(id: id)
  end

end
