
require 'spec_helper'
require 'events.rb'
require 'states.rb'
include States

describe 'Test3 Events' do
	before(:all) {
    	config = Configurator.new("test3", Date.new(2008, 11, 2))
    	config.persist
    	@election = Election.find_by_name("test3")
    	@gore =@election.candidate_for("Gore")
    	@bush = @election.candidate_for("Bush")
  	}

  it "should report same number of outcomes" do
     event = @election.event_for(
     	  		@election.candidate_for("Gore"), 
     	        @election.campaign_date(4))
     event.should_not be_nil

  end
	
end