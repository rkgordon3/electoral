# == Schema Information
#
# Table name: candidates
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  party_id   :integer
#

class Candidate < ActiveRecord::Base
  attr_accessible :name, :party_id, :party
  belongs_to :party
  has_many :voting_profiles
  def electoral_votes
  	State.all.select { |s| s.winner==self}.collect { |s| s.electoral_votes }.sum
  end
end
