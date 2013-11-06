#!/usr/bin/env ruby

require_relative 'config' 
  
file_name = 'valid_serial_numbers'  
url = "#{BASE_API}/api/tm/1.0/config/active/extra/#{file_name}"

valid_serial_numbers = 
<<END
123456
234567
345678
END

response = RestClient.put(url, valid_serial_numbers, {:content_type => 'application/octet-stream', :authorization => AUTH})  

pretty_print(response)

if response.code == 201 || response.code == 204  
    puts "File #{fileName} added"  
else  
    puts "Bad status code #{response.code} when adding file #{fileName}"  
end  
