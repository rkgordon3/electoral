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
  pending "add some examples to (or delete) #{__FILE__}"
end
