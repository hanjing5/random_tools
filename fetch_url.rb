require 'uri'
require 'net/http'

url = "http://www.whatever.com/whatever.txt"
r = Net::HTTP.get_response(URI.parse(url))

# r.body is the body/content of the url
