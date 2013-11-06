#!/usr/bin/env ruby

require_relative 'config'

url = "#{BASE_API}/api/tm/1.0/config/active/pools"

response = RestClient.get(url, {:authorization => AUTH})  
data = JSON.parse(response.body)  
pools = data['children']  
pools.each do |pool|  
    poolName = pool['name']  
    begin
        response = RestClient.get(url + '/' + URI.escape(poolName), {:authorization => AUTH})  
        pool_config = JSON.parse(response.body)  

        nodes = pool_config['properties']['basic']['nodes']  
        draining = pool_config['properties']['basic']['draining']  
        disabled = pool_config['properties']['basic']['disabled']  
        puts "Pool: #{poolName}"  
        print "   Node: "  
        nodes.each do |node|  
            print node + ' '  
        end  
        puts  
        if draining.length > 0  
            print "   Draining: "  
            draining.each do |node|  
                print node + ' '  
            end  
            puts  
        end  
        if disabled.length > 0  
            print "   Disabled: "  
            disabled.each do |node|  
                print node + ' '  
            end  
            puts  
        end  
        puts  
    rescue => e  
        puts "Error getting pool data: URL=#{url + '/' + URI.escape(poolName)} Error: #{e.message}"  
    end  
end  
