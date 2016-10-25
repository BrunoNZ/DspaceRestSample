require 'dspace'

class DspaceService < Dspace::Client

  def self.link
    @link ||= config['link']
  end

  def self.bitstreams_path
    @bitstreams_path ||= config['bitstreams_path']
  end

  def self.client
    @dspace_client ||= DspaceService.new(dspace_api: link)
  end

  private

  def self.config
    yml_file = YAML.load_file(Rails.root.join('config').to_s.concat('/dspace.yml'))
    yml = yml_file.fetch(Rails.env)
    config = Hash.new
    config['link'] = "https://#{yml['host']}:#{yml['port']}"
    config['bitstreams_path'] = yml['bitstreams_path']
    config
  end

end
