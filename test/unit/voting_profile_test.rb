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

require 'test_helper'

class VotingProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
