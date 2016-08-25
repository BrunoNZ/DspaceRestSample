class DspaceCommunitiesController < ApplicationController
  before_action :set_dspace_community, only: [:show, :edit, :update, :destroy]

  # GET /dspace_communities
  # GET /dspace_communities.json
  def index
    @dspace_communities = DspaceCommunity.all
  end

  # GET /dspace_communities/1
  # GET /dspace_communities/1.json
  def show
    @dspace_collections = @dspace_community.collections
  end

  # GET /dspace_communities/new
  def new
    @dspace_community = DspaceCommunity.new()
  end

  # GET /dspace_communities/1/edit
  def edit
  end

  # POST /dspace_communities
  # POST /dspace_communities.json
  def create
    respond_to do |format|
      if @dspace_community = DspaceCommunity.save(dspace_community_params)
        format.html { redirect_to dspace_community_path(@dspace_community.id), notice: 'Dspace community was successfully created.' }
        format.json { render :show, status: :created, location: @dspace_community }
      else
        format.html { render :new }
        format.json { render json: @dspace_community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dspace_communities/1
  # PATCH/PUT /dspace_communities/1.json
  def update
    respond_to do |format|
      if @dspace_community.update(dspace_community_params)
        format.html { redirect_to @dspace_community, notice: 'Dspace community was successfully updated.' }
        format.json { render :show, status: :ok, location: @dspace_community }
      else
        format.html { render :edit }
        format.json { render json: @dspace_community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dspace_communities/1
  # DELETE /dspace_communities/1.json
  def destroy
    @dspace_community.destroy
    respond_to do |format|
      format.html { redirect_to dspace_communities_url, notice: 'Dspace community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dspace_community
      @dspace_community = DspaceCommunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_community_params
      params.require(:dspace_community).permit(
        :name, :short_description,
        :copyright_text, :introductory_text, :sidebar_text
      )
    end
end
