require 'states.rb'
require 'events.rb'
require 'singleton.rb'
require 'configuration.rb'
require 'candidates.rb'

class Configurator

include States
include Events
include Candidates


swing_states = [AL, AK, IL, NJ]


#def event(caption);  Event.new(caption); end
#def policy(caption); Policy.new(caption) end


def describe event, &blk
   event.instance_eval &blk
   Configuration.instance.add_event event
end



begin

Configurator.new.instance_eval do 
describe event "Campaign Finance Attack Ad" do
   candidate Bush
   date "10/11/2008"
   description "A campaign finance reform intereste group runs an ad that says Bush takes in millions of dollars from tobacco companies"
   Gore outcome +1, [WI, IA, OR]
   Bush outcome -1, [MA, IA, OR]
end




describe event "Teacher Union Attack Ad" do
  candidate Gore
  date "10/12/2008"
  description "An interest group runs an ad that says Gore takes in millions of dollars from teacher's unions"
  Bush outcome +1, [WI, TN, AR]
end

describe event "The Big Event" do
   description "A really, really big event"
   date "12/31/2013"
   Bush outcome  +1, [AK, AL]
   Gore outcome  -1, [AK, AL] 
end 


describe policy "Should we expand our oil drilling, including coastal waters and in National Wildlife Refuge in Alaska?" do
   date "11/12/20"
   Gore responds yes outcome +1, [MI, MO]
   Gore responds no  outcome -1, [MI, MO], +3, [IL, MN] 
   Bush responds no outcome +1, [IA, WI]
   responds yes outcome +2, [AK] 
end
end # Configurator.new
=begin
=end
rescue  Exception => e
  
  e.backtrace[0] =~ /[a-z]+\.rb:[0-9]+/
  print e.message + " at iine " + $~[0]
  puts "...Probably a mistyped state abbreviation" if e.message.start_with?("uninitialized constant")

end




end