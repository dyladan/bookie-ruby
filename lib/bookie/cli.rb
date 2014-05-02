require 'thor'
require 'bookie/cli/get'

module Bookie
  class CLI < Thor
    method_option :count, :aliases => "-c",
    :desc => "number of bmarks to grab"
    method_option :user, :aliases => "-u",
    :desc => "execute calls in USER context"
    method_option :history, :aliases => "-h",
    :desc => "grab back into history"
  end
end