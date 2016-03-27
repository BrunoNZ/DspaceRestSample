class CommunitiesController < ApplicationController

  before_action :create_dspace_client
  before_action :set_community, only: [:show]

  # GET /communities
  def index
    @communities = @dspace.communities.all
  end

  # GET /communities/1
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_community
    @community = @dspace.communities.find(id: params[:id], expand: 'collections')
  end

  def create_dspace_client
    @dspace = DspaceService.create_client
  end

end
