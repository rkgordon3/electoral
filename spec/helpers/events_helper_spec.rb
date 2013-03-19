require 'spec_helper'

describe EventsHelper do
 
   before(:all) {
   	c = Configurator.new("test", "11/11/2008")
   	c.persist
   	@election = Election.find_by_name("test")
   	@candidate = Candidate.find_by_name("Gore")
   	@event = Event.first
   }

   it 'should generate helper string' do
      @event.outcomes_for(@candidate).size == 2
      puts @event.outcomes_for(@candidate).inspect
   	s = helper.response_form(@candidate, @event)
   end

   it 'should generate popover string' do
      puts helper.popover_tag(@candidate, @event)
   end
   
end