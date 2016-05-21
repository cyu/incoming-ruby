require "incoming/version"
require 'apiture'

module Incoming
  Client = Apiture.load_api(File.join(File.dirname(__FILE__), 'incominghq.yml'))
end
