require 'dspace'

class DspaceSchema < Dspace::Schema
  include ActiveModel::Model

  def self.all
    DspaceService.client.schema_registry.all
  end

  def self.find(schema_prefix, expand="")
    DspaceService.client.schema_registry.find_schema(
      schema_prefix: schema_prefix,
      expand: expand.delete(' ')
    )
  end

  def self.save(args)
    begin
      schema = DspaceService.client.schema_registry.create_schema(
        Dspace::Schema.new(args)
      )
    rescue
      return false
    end
    schema
  end

  def self.destroy(schema_id)
    DspaceService.client.schema_registry.delete_schema(schema_id: schema_id)
  end

end
