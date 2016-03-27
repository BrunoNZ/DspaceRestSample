module ItemsHelper

  def get_item_thumbnail(item)
    bitstream = item.bit_streams.select{|b| b.bundle_name.eql?'THUMBNAIL' }.first
    unless bitstream.nil?
      file = DspaceService.create_client.bitstreams.retrieve(id: bitstream.id, bitstreams_path: 'public/images')
      return File.basename(file.path)
    end
  end

  def get_item_bitstream(item)
    bitstream = item.bit_streams.select{|b| b.bundle_name.eql?'ORIGINAL' }.first
    unless bitstream.nil?
      return DspaceService.create_client.bitstreams.retrieve(id: bitstream.id)
    end
  end

end
