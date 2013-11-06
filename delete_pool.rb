#!/usr/bin/env ruby

require_relative 'config'

poolName = ARGV[0]
unless ARGV.length == 1
    puts "Usage: delete_pool <poolName>"
    exit
end

url = BASE_API + '/api/tm/1.0/config/active/pools/' + poolName

response = RestClient.delete(url, {:authorization => AUTH})