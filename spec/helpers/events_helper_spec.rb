require 'spec_helper'

require 'string'

describe EventsHelper do
   before(:all) {
   	c = Configurator.new("test3", Date.new(2008, 11, 2))
   	c.persist
   	@election = Election.find_by_name("test3")
   	@candidate = Candidate.find_by_name("Bush")
   	@event = Event.find(1)
   }

   it 'should generate helper string' do
      @event.outcomes_for(@election.candidate_for("Gore")).size.should == 1
      puts @event.outcomes_for(@candidate).inspect
   end

   it 'should generate popover with OK button' do
      (helper.popover_tag(@candidate, @event) =~ /Ok/).should_not be_nil
      @event.description.reset_phrase
      puts helper.popover_tag(@candidate, @event)
   end
   
end
