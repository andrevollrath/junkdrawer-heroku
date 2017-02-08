ENV['RACK_ENV'] ||= "development"

#Needed this to solve weird bug. Sinatra root is consitently set to
#/config for some annoying reason.
ENV['SIN_ROOT'] ||= File.expand_path('../../',__FILE__)

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require_all 'app'
require 'carrierwave'
