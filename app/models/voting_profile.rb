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
#

class VotingProfile < ActiveRecord::Base
  belongs_to :state
  belongs_to :candidate
  attr_accessible :candidate_id, :state_id, :votes, :candidate, :state

  def +(vp)
  	self.votes + vp.votes
  end

end
