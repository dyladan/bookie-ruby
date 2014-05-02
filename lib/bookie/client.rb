require 'configparser'
require 'bookie/helpers'

module Bookie
  class Client
    attr_accessor :config
    def initialize rc = nil
      rc ||= ENV['HOME'] + "/.bookierc"
      if !File.exist?(rc)
        puts "no bookierc"
        exit(1)
      end
      @config = ConfigParser.new(rc)["main"]
    end

    def get_by_user user = nil, count = 1, history = 1
      count += history - 1

      url = "#{@config['api_url']}/#{user}/bmarks?count=#{count}&with_content=true"
      json = Bookie::Helpers.get_json url

      bmarks = json['bmarks']

      bmark_array = bmarks.map{|bmark| Bookie::Bmark.new bmark}.to_a

      return bmark_array[history-1..count]
    end

    def search params = nil, user = nil
      if !params || params.class != Array || params == []
        return []
      end

      terms = params.join "/"

      endpoint = "/#{user}/bmarks/search/#{terms}"

      url = "#{@config['api_url']}#{endpoint}"

      json = Bookie::Helpers.get_json url
      bmarks = json['search_results']
      bmark_array = bmarks.map{|bmark| Bookie::Bmark.new bmark}.to_a

      return bmark_array
    end

  end
end