require 'dspace'

class DspaceItem < Dspace::Item
  include ActiveModel::Model

  def self.all
    ::DspaceClient.items.all
  end

  def self.find id
    ::DspaceClient.items.find(id: id, expand: 'metadata,bitstreams')
  end

  def self.save(args)
    ::DspaceClient.collections.create_item(
      Dspace::Item.new(
        'metadata' => generate_metadata_hash(args['metadata'])
      ),
      id: args['parent_collection']
    )
  end

  def self.update(args, id)
    ::DspaceClient.items.update_metadata(
      'metadata' => generate_metadata_hash(args['metadata']),
      id: id
    )
  end

  def self.destroy(id)
    ::DspaceClient.items.delete(id: id)
  end

  private

    def self.generate_metadata_hash metadata_params
      metadata_hash = []
      metadata_params.each do |key,value|
        metadata_hash << {'key' => key, 'value' => value}
      end
      metadata_hash
    end
end
