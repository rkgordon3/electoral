require 'root.rb'

require 'events.rb'
require "#{Root::Election}/candidates.rb"
require 'states.rb'
require 'election_configuration.rb'


class Configurator

include States
include Events
include Candidates

attr_reader :events


swing_states = [AL, AK, IL, NJ]

def initialize(name)
  @events = []
  @event_map = {}
  instance_eval File.open("./lib/config/elections/#{name}/campaign_events.rb").readlines.join(";")
end


def describe event, &blk
   event.instance_eval &blk
   event.send "complete"
   add_event event
end

def add_event e
  @events << e
  @event_map[e.caption] = e
end

def event_for_caption(caption) 
  @event_map[caption]
end

def candidates
  Candidates.candidates
end



begin

 # Configurator.new("pres2008").instance_eval File.open("#{Root::Election}/campaign_events.rb").readlines.join(";")

rescue  Exception => e
  
  e.backtrace[0] =~ /[a-z]+\.rb:[0-9]+/
  begin
    print e.message + " at line " + $~[0]
    puts "...Probably a mistyped state abbreviation" if e.message.start_with?("uninitialized constant")
  end unless $~.nil?

  puts e.backtrace
end


end

