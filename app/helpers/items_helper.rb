module ItemsHelper

  def get_item_bitstream(item)
    bitstream = item.bit_streams.select{|b| b.description.eql?'File Description' }.first
    dspace_client.bitstreams.retrieve(id: bitstream.id).open
    return tmpfile.path
  end

  private

  def dspace_client
    return dspace_client ||= DspaceService.create_client
  end

end
