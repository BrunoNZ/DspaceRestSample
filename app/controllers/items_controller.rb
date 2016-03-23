class ItemsController < ApplicationController

  before_action :create_dspace_client

  # GET /items
  def index
    @items = @dspace.items.all(expand: 'bitstreams')
  end

  private

  def create_dspace_client
    @dspace = DspaceService.create_client
  end

end
