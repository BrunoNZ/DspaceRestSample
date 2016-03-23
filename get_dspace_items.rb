require 'dspace'

dspace = Dspace::Client.new(dspace_api: 'https://demo.dspace.org/')
puts dspace.items.all
