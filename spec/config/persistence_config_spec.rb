require 'spec_helper'
require 'events.rb'
require 'states.rb'

include States

describe "Persistence" do
  before(:all) {
    config = Configurator.new("pres2008", "11/2/2008")
    config.persist
  

    @election_model = Election.first
  }

  it "should create a single Election" do
    Election.all.size.should == 1
  end

  it "should find two candidates" do 
    Candidate.find_by_name("Gore").should_not == nil
    Candidate.find_by_name("Bush").should_not == nil
  end

  it "should associate two candidates with Election" do
  	@election_model.candidates.size.should == 3
  	names = @election_model.candidates.collect { |c| c.name }
  	names.should include "Bush"
  	names.should include "Gore"
  end

  it "should have 7 events" do
  	@election_model.events.size.should == 7  
  end

  it "should have 1 event triggered by Bush" do
    event = @election_model.events[0]
    event.trigger_candidate.name.should == "Bush"
  end

  it "should have +1 for Gore in [WI, IA, OR]" do
    event = @election_model.events[0]
    outcomes = event.outcomes_for("Gore")
    outcomes.size.should == 1
    outcomes.first.delta.should == 1
    outcomes.first.demographics.select { |d| d.type_of == "State" }.size.should == 3
    outcomes.first.demographics.collect { |d| 
          d.type_of.constantize.find(d.value_id).abbrev 
          }.should == [WI, IA, OR]
  end

  it "should have -1 for Bush in [WI, IA, OR]" do
    event = @election_model.events[0]
    outcomes = event.outcomes_for("Bush")
    outcomes.size.should == 1
    outcomes.first.delta.should == -1
    outcomes.first.demographics.select { |d| d.type_of == "State" }.size.should == 3
    outcomes.first.demographics.collect { |d| 
          d.type_of.constantize.find(d.value_id).abbrev 
          }.should == [MA, IA, OR]
  end

  it "should have an event with title 'Caption4' " do
    event = Event.find_by_name("Caption4")
    event.nil?.should == false
    event.outcomes_for("Gore").size == 2
  end

  it "should have gore with 2 outcomes in Caption6" do
    event = Event.find_by_name("Caption6")
    event.nil?.should == false
    event.outcomes_for("Gore").size == 2
  end

end
