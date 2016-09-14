class DspaceItemsController < ApplicationController
  before_action :set_dspace_item, only: [:show, :edit, :update, :destroy]
  before_action :set_page_options, only: [:index]
  before_action :set_parent_options, only: [:new, :edit]

  # GET /dspace_items
  # GET /dspace_items.json
  def index
    @dspace_items = DspaceItem.all(@limit, @offset)
  end

  # GET /dspace_items/1
  # GET /dspace_items/1.json
  def show
    @dspace_bitstreams = @dspace_item.bit_streams || []
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
      if DspaceItem.update(dspace_item_params, params[:id])
        format.html { redirect_to dspace_items_path(@dspace_item.id),
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
      @dspace_item = DspaceItem.find(params[:id])
    end

    def set_page_options
      @page = params['page'].to_i || 0
      @page < 0 ? @page = 0 : @page
      @limit = 15
      @offset = @page * @limit
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

    def permitted_metadata_keys
      %w{
        dc.contributor.author
        dc.contributor.editor
        dc.contributor.illustrator
        dc.contributor.other
        dc.contributor
        dc.coverage.spatial
        dc.coverage.temporal
        dc.creator
        dc.date.accessioned
        dc.date.available
        dc.date.copyright
        dc.date.created
        dc.date.issued
        dc.date.submitted
        dc.date.updated
        dc.date
        dc.description.abstract
        dc.description.provenance
        dc.description.sponsorship
        dc.description.statementofresponsibility
        dc.description.tableofcontents
        dc.description.uri
        dc.description.version
        dc.description
        dc.format.extent
        dc.format.medium
        dc.format.mimetype
        dc.format
        dc.identifier.citation
        dc.identifier.govdoc
        dc.identifier.isbn
        dc.identifier.ismn
        dc.identifier.issn
        dc.identifier.other
        dc.identifier.sici
        dc.identifier.slug
        dc.identifier.uri
        dc.identifier
        dc.language.iso
        dc.language.rfc3066
        dc.language
        dc.provenance
        dc.publisher
        dc.relation.haspart
        dc.relation.hasversion
        dc.relation.isbasedon
        dc.relation.isformatof
        dc.relation.ispartof
        dc.relation.ispartofseries
        dc.relation.isreferencedby
        dc.relation.isreplacedby
        dc.relation.isversionof
        dc.relation.replaces
        dc.relation.requires
        dc.relation.uri
        dc.relation
        dc.rights.holder
        dc.rights.license
        dc.rights.uri
        dc.rights
        dc.source.uri
        dc.source
        dc.subject.classification
        dc.subject.ddc
        dc.subject.lcc
        dc.subject.lcsh
        dc.subject.mesh
        dc.subject.other
        dc.subject
        dc.title.alternative
        dc.title
        dc.type
      }
    end
end
