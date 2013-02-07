class Outcome < ActiveRecord::Base
  attr_accessible :candidate_id, :delta, :event_id, :candidate, :event
  belongs_to :candidate
  belongs_to :event
end
