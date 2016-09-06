module DspaceBitstreamsHelper
  def retrieve_link_of bitstream
    DspaceService.link + '/rest' + bitstream.retrieve_link
  end
end
