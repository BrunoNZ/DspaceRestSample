require 'dspace'

dspace = Dspace::Client.new(dspace_api: 'https://demo.dspace.org/')
# item = dspace.items.find(id: 17, expand: 'bitstreams')
# bitstream = item.bit_streams.select{|b| b.description.eql?'File Description'}.first
# puts bitstream.id

# temp = Tempfile.new('foo','./tmp/')
file = dspace.bitstreams.retrieve(id: 40).open
puts file.size
