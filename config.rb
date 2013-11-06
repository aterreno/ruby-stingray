require 'rest-client'
require 'base64'
require 'json'

BASE_API = 'https://yourriverbed:9070'
AUTH = 'Basic ' + Base64.encode64('admin:admin')

def pretty_print(response)  
  puts JSON.pretty_generate(JSON.parse(response))
end
