module ItemsHelper

  def get_item_thumbnail(item)
    thumbnail = item.bit_streams.select{|b| b.bundle_name.eql?'THUMBNAIL' }.first
    unless thumbnail.nil?
      file = DspaceService.create_client.bitstreams.retrieve(id: thumbnail.id, bitstreams_path: 'public/images')
      return File.basename(file.path)
    end
  end

  def get_item_bitstreams(item)
    bitstreams = item.bit_streams.select{|b| b.bundle_name.eql?'ORIGINAL' } || []    
  end

end
