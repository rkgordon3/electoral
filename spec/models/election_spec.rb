# == Schema Information
#
# Table name: elections
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  date       :date
#

require 'spec_helper'

describe Election do
  before(:all) do
    config = Configurator.new("pres2008", "11/2/2008")
    @election = config.persist
    @bush = Candidate.find_by_name("Bush")
    @gore = Candidate.find_by_name("Gore")
    @candidate = Candidate.find_by_name("candidate")
  end
  it 'should run' do
    @election.should_not == nil
  end


  it 'should report one event for Bush on 9-1' do
     event = @election.event_for(@bush, Date.new(2008, 9, 1))
     event.should_not == nil
  end

  it 'should report candidate exists' do
    @candidate.should_not == nil
  end

  it 'should report a 9-3 event' do
     events = Event.where(:date => Date.new(2008, 9, 3)..Date.new(2008,9,4))
     events.size.should == 1
  end
  it 'should report one event for candidate on 9-3' do
     event = @election.event_for(@candidate, Date.new(2008, 9, 3))
     event.should_not == nil
  end

  it 'should report same event for Gore/Bush on 9-8' do
     event0 = @election.event_for(@gore, Date.new(2008, 9, 3))
     event1 = @election.event_for(@bush, Date.new(2008, 9, 3))
     event0.should_not == nil
     event1.should_not == nil
     event0.should == event1
  end

end
