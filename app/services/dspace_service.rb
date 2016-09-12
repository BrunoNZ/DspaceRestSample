require 'dspace'

class DspaceService < Dspace::Client

  def self.create_client
    self.new(dspace_api: config['link'])
  end

  private

  def self.config
    config = {}

    yml_file = YAML.load_file(Rails.root.join('config').to_s.concat('/dspace.yml'))
    yml = yml_file.fetch(Rails.env)

    config['link'] = "https://#{yml['host']}:#{yml['port']}"
    # config['login'] = yml['login']
    # config['password'] = yml['password']

    config
  end
end
