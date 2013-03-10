# == Schema Information
#
# Table name: events
#
#  id          :integer         not null, primary key
#  date        :datetime
#  name        :string(255)
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  event_type  :string(255)
#  description :string(255)
#  caption     :string(255)
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
