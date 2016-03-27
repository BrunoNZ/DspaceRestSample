class CollectionsController < ApplicationController

  before_action :create_dspace_client
  before_action :set_collection, only: [:show]

  # GET /collections
  def index
    @collections = @dspace.collections.all
  end

  # GET /collections/1
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = @dspace.collections.find(id: params[:id], expand: 'items')
  end

  def create_dspace_client
    @dspace = DspaceService.create_client
  end

end
