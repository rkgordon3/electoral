# == Schema Information
#
# Table name: states
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  abbrev          :string(255)
#  electoral_votes :integer
#  population      :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class State < ActiveRecord::Base
  validates :abbrev, :name, presence: true
  validates :abbrev, length: { :maximum => 2, :minimum => 2 }
  attr_accessible :abbrev, :electoral_votes, :name, :population
  has_many :voting_profiles

  def state_tag
  	"US-" + abbrev
  end
  
  def winner
	(voting_profiles.sort.reverse)[0].candidate
  end

  def projected_votes
  	voting_profiles.collect { |v| v.votes}.sum
  end

  def profile(candidate) 
  	(voting_profiles.select { |v| v.candidate == candidate })[0]
  end

  def differential(candidate)
  	vps = voting_profiles.reverse
  	isCandidateWinner = candidate == vps[0].candidate
  	p1 =  isCandidateWinner ? vps[0] : profile(candidate)
  	p2 =  isCandidateWinner ? vps[1] :  vps[0]
  	diff = (p1.votes - p2.votes).to_f / projected_votes * 100
  end

  def self.margin_map(candidate)
  	map = {}
  	State.all.select { |s| s.winner == candidate }.each { |s| 
		diff = s.differential(candidate)
		puts "diff  #{diff.to_s} in  #{s.abbrev}"
		map[ s.state_tag] =  diff  if diff > 0 
	}
	map
   end


end
