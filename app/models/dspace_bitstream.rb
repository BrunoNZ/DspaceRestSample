require 'dspace'

class DspaceBitstream < Dspace::Bitstream
  include ActiveModel::Model

  def self.all(limit=25,offset=0)
    DspaceService.client.bitstreams.all(limit: limit, offset: offset)
  end

  def self.find(id, expand="")
    DspaceService.client.bitstreams.find(id: id, expand: expand)
  end

  def self.save(args)
    DspaceService.client.items.add_bitstream(
      args['bitstream'],
      id: args['parent_object'],
      name: args['name'],
      description: args['description'],
      bundle_name: args['bundle_name']
    )
  end

  def self.update(args, id)
    DspaceService.client.bitstreams.update(
      Dspace::Bitstream.new(args),
      id: id
    )
    unless args['bitstream'].nil?
      DspaceService.client.bitstreams.update_data(
        args['bitstream'],
        id: id
      )
    end
  end

  def self.destroy(id)
    DspaceService.client.bitstreams.delete(id: id)
  end

end
