require 'rubygems'
require 'bundler'

Bundler.require

# Require /config/environment.rb
require File.expand_path('../config/environment',  __FILE__)

run Sinatra::Application
