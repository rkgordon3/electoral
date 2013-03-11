require 'root.rb'

require 'events.rb'
require "#{Root::Election}/candidates.rb"
require 'states.rb'
require 'configuration.rb'


class Configurator

include States
include Events
include Candidates


swing_states = [AL, AK, IL, NJ]



def describe event, &blk
   event.instance_eval &blk
   event.send "complete"
   Configuration.instance.add_event event
end



begin

  Configurator.new.instance_eval File.open("#{Root::Election}/campaign_events.rb").readlines.join(";")

rescue  Exception => e
  
  e.backtrace[0] =~ /[a-z]+\.rb:[0-9]+/
  begin
    print e.message + " at line " + $~[0]
    puts "...Probably a mistyped state abbreviation" if e.message.start_with?("uninitialized constant")
  end unless $~.nil?

  puts e.backtrace
end


end

