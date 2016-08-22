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

  # GET /collections/new
  def new
    @collection = Dspace::Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Dspace::Collection.new(params[:collection])
    respond_to do |format|
      if @dspace.collections.create(collection)
        format.html { redirect_to collections_path, notice: 'Collection was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    @dspace.collections.update(collection_params)
    respond_to do |format|
      if @dspace.collections.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
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
