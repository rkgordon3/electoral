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

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
