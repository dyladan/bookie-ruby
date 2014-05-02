require 'configparser'
require 'bookie/helpers'

module Bookie
  class Client
    attr_accessor :config
    def initialize rc = "~/.bookierc"
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

  end
end