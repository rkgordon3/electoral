require 'spec_helper'

describe EventsHelper do
   before(:all) {
   	c = Configurator.new("test3", "11/11/2008")
   	c.persist
   	@election = Election.find_by_name("test")
   	@candidate = Candidate.find_by_name("Bush")
   	@event = Event.find(1)
   }

   it 'should generate helper string' do
      @event.outcomes_for(@candidate).size.should == 1
      puts @event.outcomes_for(@candidate).inspect
   end

   it 'should generate popover string' do
      puts helper.popover_tag(@candidate, @event)
   end
   
end
