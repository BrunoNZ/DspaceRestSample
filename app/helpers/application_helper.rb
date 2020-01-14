module ApplicationHelper

  def user_signed_in?
    @_current_user.signed_in?
  end

  def get_bitstream_path(bitstream, path = DspaceService.bitstreams_path)
    unless bitstream.nil?
      file = DspaceService.client.bitstreams.retrieve(
              id: bitstream.id,
              bitstreams_path: path)
      return File.basename(file.path)
    end
    return nil
  end

  def get_image_path(bitstream)
    # return get_bitstream_path(bitstream, 'public/images') || 'no_thumbnail.svg'
    return 'no_thumbnail.svg'
  end

  def retrieve_link_of bitstream
    unless bitstream.nil? || ! bitstream.is_a?(Dspace::Bitstream)
      DspaceService.link + bitstream.retrieve_link
    else
      puts "#{bitstream.inspect}"
      dspace_bitstreams_path
    end
  end

  def previsous_page_status(page)
    page == 0 ? 'disabled' : 'enabled'
  end

  def next_page_status(objects)
    (objects.empty? || objects.length < @limit) ? 'disabled' : 'enabled'
  end

  def min_numbered_page(page)
    page-2 < 0 ? 0 : page-2
  end

  def max_numbered_page(page,objects)
    (objects.empty? || objects.length < @limit) ? page : page+2
  end
end
