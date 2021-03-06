class DspaceCollectionsController < ApplicationController
  before_action :set_dspace_collection, only: [:show, :edit, :update, :destroy]
  before_action :set_page_options, only: [:index]
  before_action :set_parent_options, only: [:new, :edit]

  # GET /dspace_collections
  # GET /dspace_collections.json
  def index
    @dspace_collections = DspaceCollection.all(@limit, @offset)
  end

  # GET /dspace_collections/1
  # GET /dspace_collections/1.json
  def show
  end

  # GET /dspace_collections/new
  def new
  end

  # GET /dspace_collections/1/edit
  def edit
  end

  # POST /dspace_collections
  # POST /dspace_collections.json
  def create
    respond_to do |format|
      if @dspace_collection = DspaceCollection.save(dspace_collection_params)
        format.html { redirect_to dspace_collection_path(@dspace_collection.id),
          notice: 'Dspace collection was successfully created.' }
        format.json { render :show, status: :created, location: @dspace_collection }
      else
        format.html { render :new }
        format.json { render json: @dspace_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dspace_collections/1
  # PATCH/PUT /dspace_collections/1.json
  def update
    respond_to do |format|
      if DspaceCollection.update(dspace_collection_params, @dspace_collection.id)
        format.html { redirect_to dspace_collection_path(@dspace_collection.id),
          notice: 'Dspace collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @dspace_collection }
      else
        format.html { render :edit }
        format.json { render json: @dspace_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dspace_collections/1
  # DELETE /dspace_collections/1.json
  def destroy
    DspaceCollection.destroy(@dspace_collection.id)
    respond_to do |format|
      format.html { redirect_to dspace_collections_url, notice: 'Dspace collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_collection
      @dspace_collection = DspaceCollection.find(params[:id],'parentCommunity, items, logo')
    end

    def set_parent_options
      if params['parent'].nil?
        @parent_options = DspaceCommunity.all
        @parent_selected = @dspace_collection.nil? ? "" : @dspace_collection.parent_community
      else
        @parent_options = [DspaceCommunity.find(params['parent'])]
        @parent_selected = params['parent']
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_collection_params
      params.require(:dspace_collection).permit(
        :parent_community,
        :name, :short_description, :license,
        :copyright_text, :introductory_text, :sidebar_text,
        :logo,
      )
    end
end
