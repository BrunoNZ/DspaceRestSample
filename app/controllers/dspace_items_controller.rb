class DspaceItemsController < ApplicationController
  before_action :set_dspace_item, only: [:show, :edit, :update, :destroy]
  before_action :set_page_options, only: [:index]
  before_action :set_parent_options, only: [:new, :edit]

  # GET /dspace_items
  # GET /dspace_items.json
  def index
    @metadata_keys = permitted_metadata_keys
    @dspace_items = dspace_item_search_params.nil? ?
      DspaceItem.all(@limit, @offset) :
      DspaceItem.find_by_metadata(dspace_item_search_params)
  end

  # GET /dspace_items/1
  # GET /dspace_items/1.json
  def show
  end

  # GET /dspace_items/new
  def new
  end

  # GET /dspace_items/1/edit
  def edit
  end

  # POST /dspace_items
  # POST /dspace_items.json
  def create
    respond_to do |format|
      if @dspace_item = DspaceItem.save(dspace_item_params)
        format.html { redirect_to dspace_item_path(@dspace_item.id),
          notice: 'Dspace item was successfully created.' }
        format.json { render :show, status: :created, location: @dspace_item }
      else
        format.html { render :new }
        format.json { render json: @dspace_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dspace_items/1
  # PATCH/PUT /dspace_items/1.json
  def update
    respond_to do |format|
      if DspaceItem.update(dspace_item_params, @dspace_item.id)
        format.html { redirect_to dspace_item_path(@dspace_item.id),
          notice: 'Dspace item was successfully updated.' }
        format.json { render :show, status: :ok, location: @dspace_item }
      else
        format.html { render :edit }
        format.json { render json: @dspace_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dspace_items/1
  # DELETE /dspace_items/1.json
  def destroy
    DspaceItem.destroy(@dspace_item.id)
    respond_to do |format|
      format.html { redirect_to dspace_items_url, notice: 'Dspace item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_item
      @dspace_item = DspaceItem.find(params[:id], 'parentCollection,metadata,bitstreams')
    end

    def set_parent_options
      if params['parent'].nil?
        @parent_options = DspaceCollection.all
        @parent_selected = @dspace_item.nil? ? "" : @dspace_item.parent_collection
      else
        @parent_options = [DspaceCollection.find(params['parent'])]
        @parent_selected = params['parent']
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_item_params
      params.require(:dspace_item).permit(
        :parent_collection, :name,
        metadata: [permitted_metadata_keys]
      )
    end

    def dspace_item_search_params
      unless params[:q].nil?
        params.require(:q).permit(:key, :value)
      end
    end
  
end
