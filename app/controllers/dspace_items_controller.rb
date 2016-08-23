class DspaceItemsController < ApplicationController
  before_action :set_dspace_item, only: [:show, :edit, :update, :destroy]

  # GET /dspace_items
  # GET /dspace_items.json
  def index
    @dspace_items = DspaceItem.all
  end

  # GET /dspace_items/1
  # GET /dspace_items/1.json
  def show
  end

  # GET /dspace_items/new
  def new
    @dspace_item = DspaceItem.new
  end

  # GET /dspace_items/1/edit
  def edit
  end

  # POST /dspace_items
  # POST /dspace_items.json
  def create
    @dspace_item = DspaceItem.new(dspace_item_params)

    respond_to do |format|
      if @dspace_item.save
        format.html { redirect_to @dspace_item, notice: 'Dspace item was successfully created.' }
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
      if @dspace_item.update(dspace_item_params)
        format.html { redirect_to @dspace_item, notice: 'Dspace item was successfully updated.' }
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
    @dspace_item.destroy
    respond_to do |format|
      format.html { redirect_to dspace_items_url, notice: 'Dspace item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_item
      @dspace_item = DspaceItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_item_params
      params.fetch(:dspace_item, {})
    end
end
