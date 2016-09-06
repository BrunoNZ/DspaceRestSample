class DspaceBitstreamsController < ApplicationController
  before_action :set_dspace_bitstream, only: [:show, :edit, :update, :destroy]

  # GET /dspace_bitstreams
  # GET /dspace_bitstreams.json
  def index
    @dspace_bitstreams = DspaceBitstream.all
  end

  # GET /dspace_bitstreams/1
  # GET /dspace_bitstreams/1.json
  def show
  end

  # GET /dspace_bitstreams/new
  def new
  end

  # GET /dspace_bitstreams/1/edit
  def edit
  end

  # POST /dspace_bitstreams
  # POST /dspace_bitstreams.json
  def create
    respond_to do |format|
      if @dspace_bitstream = DspaceBitstream.save(dspace_bitstream_params)
        format.html { redirect_to dspace_bitstreams_path(@dspace_bitstream.id),
          notice: 'Dspace bitstream was successfully created.' }
        format.json { render :show, status: :created, location: @dspace_bitstream }
      else
        format.html { render :new }
        format.json { render json: @dspace_bitstream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dspace_bitstreams/1
  # PATCH/PUT /dspace_bitstreams/1.json
  def update
    respond_to do |format|
      if DspaceBitstream.update(dspace_bitstream_params, params[:id])
        format.html { redirect_to dspace_bitstreams_path(@dspace_bitstream.id),
          notice: 'Dspace bitstream was successfully updated.' }
        format.json { render :show, status: :ok, location: @dspace_bitstream }
      else
        format.html { render :edit }
        format.json { render json: @dspace_bitstream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dspace_bitstreams/1
  # DELETE /dspace_bitstreams/1.json
  def destroy
    DspaceBitstream.destroy(@dspace_bitstream.id)
    respond_to do |format|
      format.html { redirect_to dspace_bitstreams_url, notice: 'Dspace bitstream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_bitstream
      @dspace_bitstream = DspaceBitstream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_bitstream_params
      params.require(:dspace_bitstream).permit(
        :parent_object,
        :name, :description, :bundle_name,
        :bitstream
      )
    end
end
