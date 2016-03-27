class BitstreamsController < ApplicationController

  before_action :create_dspace_client
  before_action :set_bitstream, only: [:show]

  # GET /bitstreams/1
  def show
    send_file @dspace.bitstreams.retrieve(id: @bitstream.id).open,
      type: @bitstream.type,
      filename: @bitstream.name,
      :disposition => 'attachment'
    # redirect_to :back
  end

  private



  # Use callbacks to share common setup or constraints between actions.
  def set_bitstream
    @bitstream = @dspace.bitstreams.find(id: params[:id])
  end

  def create_dspace_client
    @dspace = DspaceService.create_client
  end

end
