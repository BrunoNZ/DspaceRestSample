module DspaceItemsHelper

  def get_value_of(metadata,key)
    m = @dspace_item_metadata.select { |m| m.key.eql?(key) }.first
    unless m.nil?
      return m.value
    end
    return ""
  end

  def get_thumbnail(item)
    bitstream = item.bit_streams.select{|b| b.bundle_name.eql?'THUMBNAIL' }.first
    unless bitstream.nil?
      file = DspaceService.create_client.bitstreams.retrieve(id: bitstream.id, bitstreams_path: 'public/images')
      return File.basename(file.path)
    end
    return ""
  end

end
