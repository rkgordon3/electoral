require 'spec_helper'
require 'events.rb'
require 'states.rb'

include States

describe 'Configuration' do

before(:all) {
	load 'lib/config/configurator.rb'
	@events = Configuration.instance.events
	
  @event5 = Configuration.instance.event_for_caption("Caption5")
}
  it 'should report one events' do
    @events.length.should == 1
  end

 
  it "should report yes and no outcomes for Gore in Caption5" do
    goutcomes = @event5.outcomes[:Gore]
    goutcomes.should have_exactly(1).keys
    coutcomes = @event5.outcomes[:candidate]
    coutcomes.should have_exactly(2).keys
  end
end
