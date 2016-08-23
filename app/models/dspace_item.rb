require 'dspace'

class DspaceItem < Dspace::Item
  include ActiveModel::Model

  def self.all
    dspace_client.items.all
  end

  def self.find id
    dspace_client.items.find(id: id, expand: 'metadata,bitstreams')
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end
end
