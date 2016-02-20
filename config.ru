#set up to be able to rackup 
require 'rubygems'
require 'bundler'

Bundler.require

#require config/environment 
require File.expand_path('../config/environment', __FILE__)

run Sinatra::Application