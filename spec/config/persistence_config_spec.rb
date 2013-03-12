require 'spec_helper'
require 'events.rb'
require 'states.rb'

include States

describe "Persistence" do
  before(:all) {
  	p "***************** running before "
    @election = Configurator.new("pres2008", "11/2/2008")
    @election.persist
    @events = @election.events

    @election_model = Election.first
  }

  it "should create a single Election" do
    Election.all.size.should == 1
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


end
