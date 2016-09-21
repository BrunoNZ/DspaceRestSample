module ApplicationHelper

  def get_image_path(bitstream)
    unless bitstream.nil?
      file = DspaceService.client.bitstreams.retrieve(
              id: bitstream.id,
              bitstreams_path: 'public/images')
      return File.basename(file.path)
    end
    return 'no_thumbnail.svg'
  end

  def previsous_page_status page
    page == 0 ? 'disabled' : 'enabled'
  end

  def next_page_status objects
    (objects.empty? || objects.size < 25) ? 'disabled' : 'enabled'
  end

  def min_numbered_page page
    page-2 < 0 ? 0 : page-2
  end

  def max_numbered_page(page,objects)
    (objects.empty? || objects.size < 25) ? page : page+2
  end
end
