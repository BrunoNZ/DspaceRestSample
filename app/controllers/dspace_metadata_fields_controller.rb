class DspaceMetadataFieldsController < ApplicationController
  before_action :set_dspace_metadata_field, only: [:show, :edit, :update, :destroy]

  # GET /dspace_metadata_fields
  # GET /dspace_metadata_fields.json
  def index
    @dspace_metadata_fields = DspaceMetadataField.all
  end

  # GET /dspace_metadata_fields/1
  # GET /dspace_metadata_fields/1.json
  def show
  end

  # GET /dspace_metadata_fields/new
  def new
    @dspace_metadata_field = DspaceMetadataField.new
  end

  # GET /dspace_metadata_fields/1/edit
  def edit
  end

  # POST /dspace_metadata_fields
  # POST /dspace_metadata_fields.json
  def create
    @dspace_metadata_field = DspaceMetadataField.new(dspace_metadata_field_params)

    respond_to do |format|
      if @dspace_metadata_field.save
        format.html { redirect_to @dspace_metadata_field, notice: 'Dspace metadata field was successfully created.' }
        format.json { render :show, status: :created, location: @dspace_metadata_field }
      else
        format.html { render :new }
        format.json { render json: @dspace_metadata_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dspace_metadata_fields/1
  # PATCH/PUT /dspace_metadata_fields/1.json
  def update
    respond_to do |format|
      if @dspace_metadata_field.update(dspace_metadata_field_params)
        format.html { redirect_to @dspace_metadata_field, notice: 'Dspace metadata field was successfully updated.' }
        format.json { render :show, status: :ok, location: @dspace_metadata_field }
      else
        format.html { render :edit }
        format.json { render json: @dspace_metadata_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dspace_metadata_fields/1
  # DELETE /dspace_metadata_fields/1.json
  def destroy
    @dspace_metadata_field.destroy
    respond_to do |format|
      format.html { redirect_to dspace_metadata_fields_url, notice: 'Dspace metadata field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_metadata_field
      @dspace_metadata_field = DspaceMetadataField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_metadata_field_params
      params.fetch(:dspace_metadata_field, {})
    end
end
