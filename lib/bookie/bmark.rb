require 'json'


module Bookie
  class Bmark
    attr_reader :url, :description, :hash_id, :username, :updated, :stored,
                :tag_str, :tags

    def initialize input = {"url"=>nil}
      @url = input["url"]
      input.keys.each do |name|
        instance_variable_set("@#{name}", input[name])
      end
    end

    def ==(bmark)
      return bmark.hash_id == @hash_id
    end
  end
end