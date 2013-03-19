# == Schema Information
#
# Table name: outcomes
#
#  id           :integer         not null, primary key
#  event_id     :integer
#  candidate_id :integer
#  delta        :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  trigger      :string(255)
#

require 'spec_helper'

describe Outcome do
  before(:each) {
	 e = Election.new(name: "Test")
	 @al = State.create!(abbrev: "AL",name: "Alabama" )
	 @ny = State.create!(abbrev: "NY",name: "New York" )
	 @fl = State.create!(abbrev: "FL",name: "Florida" )
	 @c = Candidate.create!(:name=>"candidate")
	 @c.voting_profiles << VotingProfile.create!(state_id: @fl.id, :votes=> 300, :candidate=>@c)
	 @c.voting_profiles << VotingProfile.create!(state_id: @al.id, :votes=> 300, :candidate=>@c)
	 @c.voting_profiles << VotingProfile.create!(state_id: @ny.id, :votes=> 400, :candidate=>@c)
	 @c.save
	 @c.reload
  }
  it 'should apply outcome to increase votes by +1' do
  	o = Outcome.create!(candidate: @c, delta: 1 )
  	o.demographics << Demographic.create!(value_id: @fl.id, outcome_id: o.id, type_of: @fl.class.to_s)
  	o.demographics << Demographic.create!(value_id: @ny.id, outcome_id: o.id, type_of: @ny.class.to_s)
  	o.demographics << Demographic.create!(value_id: @al.id, outcome_id: o.id, type_of: @al.class.to_s)
  	o.save
  	o.reload

  	before_votes = @c.votes

  	o.apply_it
  	@c.reload
  	@c.votes.should == (before_votes += before_votes * 0.01).to_i

  end

  it 'should apply outcome to decrease votes by -1' do
  	o = Outcome.create!(candidate: @c, delta: -1 )
  	o.demographics << Demographic.create!(value_id: @fl.id, outcome_id: o.id, type_of: @fl.class.to_s)
  	o.demographics << Demographic.create!(value_id: @ny.id, outcome_id: o.id, type_of: @ny.class.to_s)
  	o.demographics << Demographic.create!(value_id: @al.id, outcome_id: o.id, type_of: @al.class.to_s)
  	o.save
  	o.reload

  	before_votes = @c.votes

  	o.apply_it
  	@c.reload
  	@c.votes.should == (before_votes -= before_votes * 0.01).to_i

  end
end
