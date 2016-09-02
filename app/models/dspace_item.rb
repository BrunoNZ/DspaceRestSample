require 'dspace'

class DspaceItem < Dspace::Item
  include ActiveModel::Model

  def self.all
    dspace_client.items.all
  end

  def self.find id
    dspace_client.items.find(id: id, expand: 'metadata,bitstreams')
  end

  def self.save(args)
    dspace_client.collections.create_item(
      Dspace::Item.new(
        'metadata' => generate_metadata_hash(args['metadata'])
      ),
      id: args['parent_collection']
    )
  end

  def self.update(args, id)
    dspace_client.items.update_metadata(
      'metadata' => generate_metadata_hash(args['metadata']),
      id: id
    )
  end

  def self.destroy(id)
    dspace_client.items.delete(id: id)
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end

    def self.generate_metadata_hash metadata_params
      metadata_hash = []
      metadata_params.each do |key,value|
        metadata_hash << {'key' => key, 'value' => value}
      end
      metadata_hash
    end
end
