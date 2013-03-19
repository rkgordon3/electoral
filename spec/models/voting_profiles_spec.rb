require 'spec_helper'

describe 'Voting Profile' do
  before(:each) {
     e = Election.new(name: "Test")
     @al = State.create!(abbrev: "AL",name: "Alabama" )
     @ny = State.create!(abbrev: "NY",name: "New York" )
     @fl = State.create!(abbrev: "FL",name: "Florida" )
     @c = Candidate.create!(:name=>"candidate")
     @c.voting_profiles << VotingProfile.create!(state_id: @fl.id, :votes=> 30, :candidate=>@c)
     @c.voting_profiles << VotingProfile.create!(state_id: @al.id, :votes=> 30, :candidate=>@c)
     @c.voting_profiles << VotingProfile.create!(state_id: @ny.id, :votes=> 40, :candidate=>@c)
     @c.save
     @c.reload

  }
  it 'element 0 should be largest when reversed' do
    winner = Candidate.new(:name=>"winner")
    second = Candidate.new(:name=>"second")
    third = Candidate.new(:name=>"third")
    v0 = VotingProfile.new(:votes => 100, :candidate=>winner)
    v1 = VotingProfile.new(:votes => 80, :candidate=>second)
    v2 = VotingProfile.new(:votes => 50, :candidate=>third)
    vps = [v2, v1, v0]

    sorted = vps.sort.reverse

    sorted[0].candidate.name.should == winner.name
    sorted[2].candidate.name.should == third.name
  end


  it 'should have 100 votes' do
     @c.votes.should == 100
  end    
end
