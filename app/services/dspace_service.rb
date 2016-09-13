require 'dspace'

class DspaceService < Dspace::Client

  def self.client
    @link ||= link
    @dspace_client ||= DspaceService.new(dspace_api: @link)
    @dspace_client
  end

  private

  def self.link
    yml_file = YAML.load_file(Rails.root.join('config').to_s.concat('/dspace.yml'))
    yml = yml_file.fetch(Rails.env)
    link = "https://#{yml['host']}:#{yml['port']}"
    link
  end
end
