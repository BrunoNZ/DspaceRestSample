require 'dspace'

class DspaceService

  # ID's of collections
  TEST_COLLECTION = 4
  PORTALMEC_COLLECTION = 3
  BD_INT_OBJETOS_COLLECTION = 2

  def self.create_client
    dspace_client = Dspace::Client.new(dspace_api: 'https://demo.dspace.org/')
    # dspace_client.login config['login'], config['password']
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
