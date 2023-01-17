require 'net/http'
require 'json'
require 'time'
require 'nokogiri'

uri = URI('https://www.nasa.gov/api/2/ubernode/479003')
response = Net::HTTP.get_response(uri)
parsed_json = JSON.parse(response.body)
data_hash = {
    title: parsed_json["_source"]["title"],
    date: Time.parse(parsed_json["_source"]["promo-date-time"]).strftime("%Y-%m-%d"),
    release_no: parsed_json["_source"]["release-id"],
    article: Nokogiri::HTML(parsed_json["_source"]["body"]).content
}

puts data_hash

