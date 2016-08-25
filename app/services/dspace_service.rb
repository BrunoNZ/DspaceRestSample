require 'dspace'

class DspaceService < Dspace::Client

  def self.create_client
    dspace_client = self.new(dspace_api: config['link'])
    dspace_client.login config['login'], config['password']
    dspace_client
  end

  def self.link
    config['link']
  end

  private

  def self.config
    config = {}

    if Rails.env.production?
      config['link'] = "https://#{ENV['PORTALMEC_DSPACE_HOST']}:#{ENV['PORTALMEC_DSPACE_PORT']}"
      config['login'] = ENV['PORTALMEC_DSPACE_LOGIN']
      config['password'] = ENV['PORTALMEC_DSPACE_PASSWORD']
    else
      yml_file = YAML.load_file(Rails.root.join('config').to_s.concat('/dspace.yml'))
      yml = yml_file.fetch(Rails.env)

      config['link'] = "https://#{yml['host']}:#{yml['port']}"
      config['login'] = yml['login']
      config['password'] = yml['password']
    end

    config
  end
end
