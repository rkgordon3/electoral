require 'spec_helper'

describe State do
   before(:each) do
     @wi = State.new(:abbrev => "WI")
     bush = Candidate.new(:name => "Bush")
     @winner = Candidate.new(:name => "Gore")
     @wi.voting_profiles << VotingProfile.new(:candidate=>bush, :votes => 12340000)
     @wi.voting_profiles << VotingProfile.new(:candidate=>@winner, :votes => 12400000)
   end
  
   it 'winner differential should be non-zero ' do
     puts @wi.differential(@winner)
     @wi.differential(@winner).should > 0
   end
end
