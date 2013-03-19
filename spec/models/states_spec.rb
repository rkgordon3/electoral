require 'spec_helper'

describe State do
   before(:each) do
     @wi = State.new(:abbrev => "WI")
     bush = Candidate.new(:name => "Bush")
     @winner = Candidate.new(:name => "Gore")
     @wi.voting_profiles << VotingProfile.new(:candidate=>bush, :votes => 1000)
     @wi.voting_profiles << VotingProfile.new(:candidate=>@winner, :votes => 1100)
   end
  
   it 'winner differential should be non-zero ' do
     @wi.differential(@winner).should > 0
   end

   it 'differential should be 1000' do 
    @wi.differential(@winner).should be_within(0.005).of(4.76)
     
   end

   it 'gore should be winner WI' do
     @wi.winner.should == @winner
   end
end
