#!/usr/bin/env ruby

require_relative "config"

url = "#{BASE_API}/api/tm/1.0/config/active"

response = RestClient.get(url, {:authorization => AUTH})

data = JSON.parse(response.body)
children =  data['children']
children.each do |child|      
    response = RestClient.get("#{BASE_API}#{child['href']}", {:authorization => AUTH})
    pretty_print(response)
end