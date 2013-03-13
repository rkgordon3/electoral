# == Schema Information
#
# Table name: voting_profiles
#
#  id           :integer         not null, primary key
#  state_id     :integer
#  candidate_id :integer
#  votes        :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  election_id  :integer
#

class VotingProfile < ActiveRecord::Base
  belongs_to :state
  belongs_to :candidate
  belongs_to :election
  attr_accessible :candidate_id, :state_id, :votes, :candidate, :state, :election_id

  def +(vp)
  	self.votes + vp.votes
  end

  def <=>(vp)
  	self.votes <=> vp.votes
  end


end
