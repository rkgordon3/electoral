require 'spec_helper'
require 'events.rb'
require 'states.rb'

include States

describe 'Configuration' do

before(:each) {
	load 'lib/config/configurator.rb'
	@events = Configuration.instance.events
	@event1 = Configuration.instance.event_for_caption("Caption1")
	@event2 = Configuration.instance.event_for_caption("Caption2")
	@event3 = Configuration.instance.event_for_caption("Caption3")
	@event4 = Configuration.instance.event_for_caption("Caption4")
}
  it 'should report four events' do
    @events.length.should == 4
  end

  it "should contain proper captions" do
  	captions = @events.each.collect { |e| e.caption }
  	captions.should include "Caption1"
  	captions.should include "Caption2"    
  end

  it "should have Bush as trigger candidate for Caption1" do
  	@event1.candidate.should == "Bush"
  end

  it "should have Gore as trigger candidate for Caption2" do
  	@event2.candidate.should == "Gore"    
  end

  it "should have universal trigger candidate for Caption3" do
  	@event3.candidate.should == :candidate 
  end

  it "should have two outcomes for Caption1 event" do
	@event1.outcomes.length.should == 2    
  end

  it "should have Gore +1 in WI IA OR for Caption1" do
  	outcomes =  @event1.outcomes[:Gore]
  	outcomes.length.should == 1
  	outcomes[0].rule.should == 1
  	outcomes[0].demographics.should == [WI, IA, OR]
  end

   it "should have Bush -1 in MA IA OR for Caption1" do
  	outcomes =  @event1.outcomes[:Bush]
  	outcomes.length.should == 1
  	outcomes[0].rule.should == -1
  	outcomes[0].demographics.should == [MA, IA, OR]
  end

  it "should report  10/11/2008 as date for Caption1" do
    @event1.event_date.should == "10/11/2008" 
  end

  it "should report yes and no outcomes for Gore in Caption4" do
    outcomes = @event4.outcomes[:Gore]
    outcomes.should have_exactly(2).keys
    outcomes[:yes].size == 1
    outcomes[:no].size == 1
    outcomes[:yes][0].rule.should == 1
    outcomes[:no][0].rule.should == -1
  end
end
