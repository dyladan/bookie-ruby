require 'configparser'
require 'net/http'
require 'json'

module Bookie
  class Client
    attr_accessor :config
    def initialize rc = "~/.bookierc"
      @config = ConfigParser.new(rc)["main"]
    end

    def get_by_user user = nil, count = 1, history = 1
      count += history - 1
      user ||= @config['username']
      uri = URI "#{@config['api_url']}/#{user}/bmarks?count=#{count}&with_content=true"
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      json = JSON.parse(response.body)

      bmarks = json['bmarks']

      bmark_array = bmarks.map{|bmark| Bookie::Bmark.new bmark}.to_a

      return bmark_array[history-1..count]
    end

  end
end