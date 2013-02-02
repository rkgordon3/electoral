require 'spec_helper'

describe 'Voting Profile' do
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
end
