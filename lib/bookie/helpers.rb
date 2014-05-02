require 'net/http'
require 'json'

module Bookie
  module Helpers
    def self.get_json url
      uri = URI url
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      json = JSON.parse(response.body)

      return json
    end
  end
end