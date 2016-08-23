require 'dspace'

class DspaceCollection < Dspace::Collection
  include ActiveModel::Model

  def self.all
    dspace_client.collections.all
  end

  def self.find id
    dspace_client.collections.find(id: id)
  end

  def items
    dspace_client.collections.items(id: self.id)
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end
end
