#!/usr/bin/env ruby

require_relative 'config'

unless ARGV.length == 2
    puts "Usage:  modify_pool <poolName> <host1:port1>,<host2:port2>,etc"
    exit
end

pool_name = ARGV[0]
nodes = ARGV[1].split(',')
  
pool_config = {
    'properties' => {'basic' => {'nodes' => nodes}}}
  
url = "#{BASE_API}/api/tm/1.0/config/active/pools/#{pool_name}"

response = RestClient.put(url, JSON.generate(pool_config), {:content_type => :json, :authorization => AUTH})

r = JSON.parse(response)

nodes.each do |node|
  if (r['properties']['basic']['draining'].include? node)
    puts "Removing #{node} from draining list"
    r['properties']['basic']['draining'].delete(node)
  end
end

response = RestClient.put(url, JSON.generate(r), {:content_type => :json, :authorization => AUTH})

pretty_print(response)