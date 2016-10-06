class DspaceReportsController < ApplicationController
  before_action :set_page_options, only: [:item_query]

  # GET /dspace_reports/item_query
  def item_query
    @filters = DspaceReport.filters.map{|f| [f.title, f.filter_name]}
    @collections = DspaceCollection.all.map{|c| [c.name, c.id]}
    @operators = DspaceReport.operators
    @metadata_keys = permitted_metadata_keys

    @dspace_items = dspace_item_search_params.nil? ?
      [] :
      DspaceReport.filtered_items(dspace_item_search_params)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def dspace_item_search_params
      unless params[:q].nil?
        params.require(:q)
        # .permit(
        #   :limit, :offset, expand: [],
        #   collection: [], filters: [],
        #   query_field: [], query_op: [], query_val: []
        # )
        params['q']
      end
    end

end
