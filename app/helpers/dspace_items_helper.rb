module DspaceItemsHelper

  def get_value_of(metadata,key)
    m = metadata.select { |m| m.key.eql?(key) }.first
    unless m.nil?
      return m.value
    end
    return ""
  end

  def get_thumbnail(item)
    bitstream = item.bit_streams.select{|b| b.bundle_name.eql?'THUMBNAIL' }.first
  end

  def get_selected_metadata
    params[:q].nil? ? 'dc.title' : params[:q][:key]
  end

  def get_input_value
    params[:q].nil? ? '' : params[:q][:value]
  end

end
