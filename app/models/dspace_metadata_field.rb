require 'dspace'

class DspaceMetadataField < Dspace::MetadataField
  include ActiveModel::Model

  def self.all(schema_prefix, expand="")
    DspaceService.client.schema_registry.find_schema(
      schema_prefix: schema_prefix,
      expand: expand.delete(' ')
    ).fields
  end

  def self.find(field_id, expand="")
    DspaceService.client.schema_registry.find_metadata_field(
      field_id: field_id,
      expand: expand.delete(' ')
    )
  end

  def self.save(args)
    DspaceService.client.schema_registry.create_metadata_field(
      Dspace::MetadataField.new(args),
      schema_prefix: args['schema_prefix']
    )
  end

  def self.update(args, field_id)
    DspaceService.client.schema_registry.create_metadata_field(
      Dspace::MetadataField.new(args),
      field_id: field_id
    )
  end

  def self.destroy(field_id)
    DspaceService.client.schema_registry.delete_schema(field_id: field_id)
  end

end
