class DspaceSchemasController < ApplicationController
  before_action :set_dspace_schema, only: [:show, :edit, :update, :destroy]

  # GET /dspace_schemas
  # GET /dspace_schemas.json
  def index
    @dspace_schemas = DspaceSchema.all
  end

  # GET /dspace_schemas/1
  # GET /dspace_schemas/1.json
  def show
  end

  # GET /dspace_schemas/new
  def new
  end

  # GET /dspace_schemas/1/edit
  def edit
  end

  # POST /dspace_schemas
  # POST /dspace_schemas.json
  def create
    respond_to do |format|
      if @dspace_schema = DspaceSchema.save(dspace_schema_params)
        format.html { redirect_to dspace_schema_path(@dspace_schema.prefix),
          notice: 'Dspace schema was successfully created.' }
        format.json { render :show, status: :created, location: @dspace_schema }
      else
        format.html { render :new }
        format.json { render json: @dspace_schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dspace_schemas/1
  # PATCH/PUT /dspace_schemas/1.json
  def update
    respond_to do |format|
      if DspaceSchema.update(dspace_schema_params, @dspace_schema.id)
        format.html { redirect_to dspace_schema_path(@dspace_schema.prefix),
          notice: 'Dspace schema was successfully updated.' }
        format.json { render :show, status: :ok, location: @dspace_schema }
      else
        format.html { render :edit }
        format.json { render json: @dspace_schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dspace_schemas/1
  # DELETE /dspace_schemas/1.json
  def destroy
    DspaceSchema.destroy(@dspace_schema.id)
    respond_to do |format|
      format.html { redirect_to dspace_schemas_url,
        notice: 'Dspace schema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_schema
      @dspace_schema = DspaceSchema.find(params[:id],'fields')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_schema_params
      params.require(:dspace_schema).permit(
        :prefix, :namespace
      )
    end
end
