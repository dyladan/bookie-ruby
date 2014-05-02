require 'thor'

module Bookie
  class CLI < Thor
    desc "search TERMS",
    "search for bookmarks"
    method_option :count, :aliases => "-c",
    :desc => "number of bmarks to grab"
    method_option :user, :aliases => "-u",
    :desc => "search for bmarks from USER"

    def search(terms, user = nil)
      if File.exist?("bookierc")
        client = Bookie::Client.new "bookierc"
      elsif File.exist?(ENV['HOME'] + "/.bookierc")
        client = Bookie::Client.new ENV['HOME'] + "/.bookierc"
      else
        puts "no bookierc"
        exit(1)
      end

      count = options[:count] || 1
      if options[:user]
        user = options[:user]
      end

      terms = terms.split

      marks = client.search(terms, user)

      marks.each do |bmark|
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
