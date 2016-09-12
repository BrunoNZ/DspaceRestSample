require 'dspace'

class DspaceCollection < Dspace::Collection
  include ActiveModel::Model

  def self.all
    ::DspaceClient.collections.all
  end

  def self.find id
    ::DspaceClient.collections.find(id: id, expand: 'items')
  end

  def self.save(args)
    ::DspaceClient.communities.create_collection(
      Dspace::Collection.new(args),
      id: args['parent_community']
    )
  end

  def self.update(args, id)
    ::DspaceClient.collections.update(Dspace::Collection.new(args), id: id)
  end

  def self.destroy(id)
    ::DspaceClient.collections.delete(id: id)
  end

end
