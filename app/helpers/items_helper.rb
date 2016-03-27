module ItemsHelper

  def get_item_bitstream(item)
    bitstream = item.bit_streams.select{|b| b.bundle_name.eql?'THUMBNAIL' }.first
    unless bitstream.nil?
      file = DspaceService.create_client.bitstreams.retrieve(id: bitstream.id, bitstreams_path: 'public/images')
      return File.basename(file.path)
    end
  end
  
end
