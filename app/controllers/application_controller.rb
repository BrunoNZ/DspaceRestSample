require 'dspace'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  def set_page_options
    @page = params['page'].to_i || 0
    @page < 0 ? @page = 0 : @page
    @limit = 15
    @offset = @page * @limit
  end

  def permitted_metadata_keys
    metadata_keys ||= %w{
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

  private

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def set_current_user
    DspaceService.client.access_token = session[:dspace_access_token]
    @_current_user ||= DspaceUser.current_status
  end
end
