require 'dspace'

class DspaceBitstream < Dspace::Bitstream
  include ActiveModel::Model

  def self.all(limit=25,offset=0)
    ::DspaceClient.bitstreams.all(limit: limit, offset: offset)
  end

  def self.find(id)
    ::DspaceClient.bitstreams.find(id: id)
  end

  def self.save(args)
    ::DspaceClient.items.add_bitstream(
      args['bitstream'],
      id: args['parent_object'],
      name: args['name'],
      description: args['description'],
      bundle_name: args['bundle_name']
    )
  end

  def self.update(args, id)
    ::DspaceClient.bitstreams.update(
      Dspace::Bitstream.new(args),
      id: id
    )
    unless args['bitstream'].nil?
      ::DspaceClient.bitstreams.update_data(
        args['bitstream'],
        id: id
      )
    end
  end

  def self.destroy(id)
    ::DspaceClient.bitstreams.delete(id: id)
  end

end
