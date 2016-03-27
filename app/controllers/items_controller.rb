class ItemsController < ApplicationController

  before_action :create_dspace_client
  before_action :set_item, only: [:show]

  # GET /items
  def index
    @items = @dspace.items.all
  end

  # GET /clients/1
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = @dspace.items.find(id: params[:id], expand: 'all')
  end

  def create_dspace_client
    @dspace = DspaceService.create_client
  end

end
