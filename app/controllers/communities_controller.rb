class CommunitiesController < ApplicationController

  before_action :create_dspace_client
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  # GET /communities
  def index
    @communities = @dspace.communities.all
  end

  # GET /communities/1
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    community = Community.new(community_params)
    respond_to do |format|
      if @dspace.communities.create(community)
        format.html { redirect_to communities_path, notice: 'Community was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @dspace.communities.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_community
    @community = @dspace.communities.find(id: params[:id], expand: 'collections')
  end

  def community_params
    params.require(:community).permit(
      :name, :short_description,
      :copyright_text, :introductory_text, :sidebar_text
    )
  end

  def create_dspace_client
    @dspace ||= DspaceService.create_client
  end

end
