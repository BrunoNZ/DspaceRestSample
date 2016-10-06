require 'dspace'

class DspaceReport
  include ActiveModel::Model

  def self.filters
    DspaceService.client.report.filters
  end

  def self.filtered_items(args)
    DspaceService.client.report.filtered_items(
      :'collSel[]' => args['collection'] || [],
      :'query_field[]' => args['query_field'] || [],
      :'query_op[]' => args['query_op'] || [],
      :'query_val[]' => args['query_val'] || [],
      limit: args['limit'] || '100',
      offset: args['offset'] || '0',
      expand: args['expand'] || '',
      filters: compact_hash(args['filters']) || []
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

  private

    def self.compact_hash h
      h.reject { |a| a.empty? }.join(',') unless h.nil?
    end

end
