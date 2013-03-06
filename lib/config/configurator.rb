election_root = "./elections/pres2008"

require 'events.rb'
require "#{election_root}/candidates.rb"
require 'states.rb'
require 'singleton.rb'
require 'configuration.rb'


class Configurator

include States
include Events
include Candidates


swing_states = [AL, AK, IL, NJ]


def describe event, &blk
   event.instance_eval &blk
   Configuration.instance.add_event event
end



begin

  Configurator.new.instance_eval File.open("./elections/pres2008/campaign_events.rb").readlines.join(";")
  puts Configuration.instance.events


rescue  Exception => e
  
  e.backtrace[0] =~ /[a-z]+\.rb:[0-9]+/
  begin
    print e.message + " at iine " + $~[0]
    puts "...Probably a mistyped state abbreviation" if e.message.start_with?("uninitialized constant")
  end unless $~.nil?

  puts e.backtrace
end


end

