#!/usr/bin/env ruby

require_relative 'config' 
  
vs = "mol-hsk-unbongo-vs"  
url = "#{BASE_API}/api/tm/1.0/config/active/vservers/#{URI.escape(vs)}"
  
auth = 'Basic ' + Base64.encode64('docker:automate')  

response = RestClient.get(url, {:authorization => auth})  

vs_config = JSON.parse(response.body)  
if vs_config['properties']['basic']['enabled']              
    puts "#{vs} is enabled.  Disabling it."  
    newvs_config = {'properties' => {'basic' => {'enabled' => false}}}        
else
    puts "#{vs} is Disabled.  Enabling it."          
    newvs_config = {'properties' => {'basic' => {'enabled' => true}}}              
end  

response = RestClient.put(url, JSON.generate(newvs_config), {:content_type => :json, :authorization => auth})  

pretty_print(response)