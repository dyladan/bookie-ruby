require 'thor'

module Bookie
  class CLI < Thor
    desc "get [USERNAME [HISTORY]] [--count #]", "get bmarks by USERNAME"
    method_option :count, :aliases => "-c", :desc => "number of bmarks to grab"
    def get(user = nil, history = "1")
      count = options[:count] || 1
      client = Bookie::Client.new "bookierc"
      client.get_by_user(user, count.to_i, history.to_i).each do |bmark|
        if !user
          puts bmark.username
        end
        puts bmark.description
        puts bmark.url
        puts "stored: #{bmark.stored}"
        if bmark.updated != ""
          puts "updated: #{bmark.updated}"
        end
        puts
      end
    end
  end
end