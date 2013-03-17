require 'spec_helper'
require 'events.rb'
require 'states.rb'
include States


describe "Events" do
  before(:all) {
    config = Configurator.new("pres2008", "11/2/2008")
    config.persist
    @election = Election.find_by_name("pres2008")
  }

  it "should report same number of outcomes" do
     @election.events.last.outcomes_for("Gore").size.should == 2
     @election.events.last.outcomes_for(Candidate.find_by_name("Gore")).size.should == 2
     @election.events.last.outcomes_for(Candidate.find_by_name("Gore").id).size.should == 2
  end

  it 'should report one yes outcome for Gore for Caption6' do
    g = Candidate.find_by_name("Gore")
    e = Event.find_by_name("Caption6")
    outcomes = e.outcomes_for(g, "yes")
    outcomes.size.should == 1
    
  end

end
