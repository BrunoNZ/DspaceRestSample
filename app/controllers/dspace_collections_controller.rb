class DspaceCollectionsController < ApplicationController
  before_action :set_dspace_collection, only: [:show, :edit, :update, :destroy]

  # GET /dspace_collections
  # GET /dspace_collections.json
  def index
    @dspace_collections = DspaceCollection.all
  end

  # GET /dspace_collections/1
  # GET /dspace_collections/1.json
  def show
    puts "==========> #{@dspace_collection.id}"
    puts "------------> #{DspaceService.create_client.collections.items(id: @dspace_collection.id)}"
    @dspace_items = @dspace_collection.items
  end

  # GET /dspace_collections/new
  def new
    @dspace_collection = DspaceCollection.new
  end

  # GET /dspace_collections/1/edit
  def edit
  end

  # POST /dspace_collections
  # POST /dspace_collections.json
  def create
    @dspace_collection = DspaceCollection.new(dspace_collection_params)

    respond_to do |format|
      if @dspace_collection.save
        format.html { redirect_to @dspace_collection, notice: 'Dspace collection was successfully created.' }
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
      if @dspace_collection.update(dspace_collection_params)
        format.html { redirect_to @dspace_collection, notice: 'Dspace collection was successfully updated.' }
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
    @dspace_collection.destroy
    respond_to do |format|
      format.html { redirect_to dspace_collections_url, notice: 'Dspace collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_collection
      @dspace_collection = DspaceCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_collection_params
      params.fetch(:dspace_collection, {})
    end
end
