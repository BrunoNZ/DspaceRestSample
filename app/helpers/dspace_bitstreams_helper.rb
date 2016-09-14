module DspaceBitstreamsHelper
  def retrieve_link_of bitstream
    DspaceService.link + bitstream.retrieve_link
  end
end
