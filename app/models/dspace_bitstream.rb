require 'dspace'

class DspaceBitstream < Dspace::Bitstream
  include ActiveModel::Model

  def self.all
    dspace_client.bitstreams.all
  end

  def self.find id
    dspace_client.bitstreams.find(id: id)
  end

  private

    def self.dspace_client
      @dspace ||= DspaceService.create_client
    end

end