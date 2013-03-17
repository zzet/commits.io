# This file is used by Rack-based servers to start the application.

require 'resque/server'
require ::File.expand_path('../config/environment',  __FILE__)
run Rack::URLMap.new "/" => CommitsIO::Application,  "/resque" => Resque::Server.new
#run CommitsIO::Application
