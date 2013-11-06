#!/usr/bin/env ruby

require_relative 'config'

poolName = ARGV[0]
unless ARGV.length == 1
    puts "Usage: drain <poolName>"
    exit
end

url = BASE_API + '/api/tm/1.0/config/active/pools/' + poolName

response = RestClient.get(url, {:authorization => AUTH})

r = JSON.parse(response)

puts JSON.pretty_generate(r)

# If the first node is not already draining, add it to the draining list  
node = r['properties']['basic']['nodes'].first;

if ( !r['properties']['basic']['draining'].include?(node))
    print "Planning to drain: #{node}";  
    r['properties']['basic']['draining'] << node
end
  
response = RestClient.put(url, JSON.generate(r), {:content_type => :json, :authorization => AUTH})

pretty_print(response)