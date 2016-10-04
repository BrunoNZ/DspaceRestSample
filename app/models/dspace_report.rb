require 'dspace'

class DspaceReport
  include ActiveModel::Model

  def self.filters
    DspaceService.client.query_report.filters
  end

  def self.filtered_items(args)
    DspaceService.client.query_report.filtered_items(
      :'collSel[]' => args['collection'] || '',
      :'query_field[]' => args['query_field'] || '',
      :'query_op[]' => args['query_op'] || '',
      :'query_val[]' => args['query_val'] || '',
      limit: args['limit'] || '100',
      offset: args['offset'] || '0',
      expand: args['expand'] || 'parentCollection,metadata',
      filters: args['filters'] || ''
    )
  end

  def self.operators
    operators ||= [
      ['Exists','exists'],
      ['Does not exist','doesnt_exist'],
      ['Equals','equals'],
      ['Not equals','not_equals'],
      ['Like','like'],
      ['Not like','not_like'],
      ['Contains','contains'],
      ['Does not contain','doesnt_contain'],
      ['Matches','matches'],
      ['Does not match','doesnt_match']
    ]
  end

end
#
# https://demo.dspace.org/rest/filtered-items?collSel[]=3cf09f45-2bfc-442d-b566-cfe20009119d&expand=&filters=&limit=100&offset=0&query_field[]=dc.contributor.author&query_op[]=&query_val[]=
