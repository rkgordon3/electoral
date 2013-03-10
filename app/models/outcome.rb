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
#

class Outcome < ActiveRecord::Base
  attr_accessible :candidate_id, :delta, :event_id, :candidate, :event
  belongs_to :candidate
  belongs_to :event
end
