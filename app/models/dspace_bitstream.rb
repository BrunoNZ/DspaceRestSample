require 'dspace'

class DspaceBitstream < Dspace::Bitstream
  include ActiveModel::Model

  def self.all
    dspace_client.bitstreams.all
  end

  def self.find id
    dspace_client.bitstreams.find(id: id)
  end

  def self.save(args)
    dspace_client.items.add_bitstream(
      args['bitstream'],
      id: args['parent_object'],
      name: args['name'],
      description: args['description'],
      bundle_name: args['bundle_name']
    )
  end

  def self.update(args, id)
    dspace_client.bitstreams.update(
      Dspace::Bitstream.new(args),
      id: id
    )
    unless args['bitstream'].nil?
      dspace_client.bitstreams.update_data(
        args['bitstream'],
        id: id
      )
    end
  end

  def self.destroy(id)
    dspace_client.bitstreams.delete(id: id)
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end

end
