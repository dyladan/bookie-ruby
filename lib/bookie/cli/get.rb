require 'thor'

module Bookie
  class CLI < Thor
    desc "get [USERNAME [HISTORY]] [--count] [--history]",
    "get bmarks by USERNAME"
    method_option :count, :aliases => "-c",
    :desc => "number of bmarks to grab"
    method_option :history, :aliases => "-h",
    :desc => "grab back into history"

    def get(user = nil, history = "1")
      if File.exist?("bookierc")
        client = Bookie::Client.new "bookierc"
      elsif File.exist?(ENV['HOME'] + "/.bookierc")
        client = Bookie::Client.new ENV['HOME'] + "/.bookierc"
      else
        puts "no bookierc"
        exit(1)
      end

      count = options[:count] || 1
      history = options[:history] || history
      if options[:user]
        client.config["username"] = options[:user]
      end

      client.get_by_user(user, count.to_i, history.to_i).each do |bmark|
        if !user
          puts bmark.username
        end
        puts "#{bmark.description} || #{bmark.tag_str}"
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
