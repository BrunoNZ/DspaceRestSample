require 'dspace'

class DspaceService < Dspace::Client

  private

  def access_token
    @dspace_access_token = session[:dspace_access_token]
  end

  def link
    yml_file = YAML.load_file(Rails.root.join('config').to_s.concat('/dspace.yml'))
    yml = yml_file.fetch(Rails.env)
    @link = "https://#{yml['host']}:#{yml['port']}"
  end
end
