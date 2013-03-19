# == Schema Information
#
# Table name: candidates
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  party_id      :integer
#  image         :string(255)
#  election_id   :integer
#  campaign_date :date
#

class Candidate < ActiveRecord::Base

  attr_accessible :name, :party_id, :party, :image, :election, :campaign_date
  belongs_to :party
  belongs_to :election
  has_many :voting_profiles

  def electoral_votes
  	State.all.select { |s| s.winner==self}.collect { |s| s.electoral_votes }.sum
  end

  def profile_for(demographic) 
  	voting_profiles.each.select { |p| p.state_id == demographic.id }[0]
  end

  def votes
    voting_profiles.collect { |x| x.votes }.reduce(:+)
  end

end
