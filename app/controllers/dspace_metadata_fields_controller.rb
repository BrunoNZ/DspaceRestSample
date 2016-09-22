class DspaceMetadataFieldsController < ApplicationController
  before_action :set_dspace_metadata_field, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_options, only: [:new, :edit]

  # GET /dspace_metadata_fields
  # GET /dspace_metadata_fields.json
  def index
    @dspace_metadata_fields = DspaceMetadataField.all('dc','fields')
  end

  # GET /dspace_metadata_fields/1
  # GET /dspace_metadata_fields/1.json
  def show
  end

  # GET /dspace_metadata_fields/new
  def new
  end

  # GET /dspace_metadata_fields/1/edit
  def edit
  end

  # POST /dspace_metadata_fields
  # POST /dspace_metadata_fields.json
  def create
    respond_to do |format|
      if @dspace_metadata_field = DspaceMetadataField.save(dspace_metadata_field_params)
        format.html { redirect_to dspace_metadata_field_path(@dspace_metadata_field.id),
          notice: 'Dspace metadata field was successfully created.' }
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
      if DspaceMetadataField.update(dspace_metadata_field_params, @dspace_metadata_field.id)
        format.html { redirect_to dspace_metadata_field_path(@dspace_metadata_field.id),
          notice: 'Dspace metadata field was successfully updated.' }
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
    DspaceMetadataField.destroy(@dspace_metadata_field.id)
    respond_to do |format|
      format.html { redirect_to dspace_metadata_fields_url,
        notice: 'Dspace metadata field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_metadata_field
      @dspace_metadata_field = DspaceMetadataField.find(params[:id])
    end

    def set_parent_options
      if params['parent'].nil?
        @parent_options = DspaceSchema.all
        @parent_selected = @dspace_metadata_field.nil? ? "" : @dspace_metadata_field.parent_schema
      else
        @parent_options = [DspaceSchema.find(params['parent'])]
        @parent_selected = params['parent']
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_metadata_field_params
      params.require(:dspace_metadata_field).permit(
        :element, :qualifier, :description, :parent_schema
      )
    end
end
