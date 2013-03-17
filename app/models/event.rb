# == Schema Information
#
# Table name: events
#
#  id           :integer         not null, primary key
#  date         :datetime
#  name         :string(255)
#  location_id  :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  event_type   :string(255)
#  description  :string(255)
#  caption      :string(255)
#  candidate_id :integer
#  election_id  :integer
#

class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location_id, :location, :event_type, :description, :trigger_candidate, :election_id
  belongs_to :location, :class_name => "State"
  has_many :outcomes
  belongs_to :election
  belongs_to :trigger_candidate, class_name: "Candidate", foreign_key: :candidate_id

  #
  # Return all outcomes for this event for a candidate. name
  # may be either a string, a Candidate or an id.
  #
  # If response is supplied, results are filtered to that
  # value
  #
  def outcomes_for(name, response = nil) 
    result = nil
  	case name
  	when Candidate
  		result = outcomes.where(:candidate_id => name.id)
  	when Fixnum
  		result = outcomes.where(:candidate_id => name)
  	else
  		result = outcomes.where(:candidate_id => Candidate.find_by_name(name))
  	end
    result = result || outcomes.where(:name => "candidate")
    result = result.where(:trigger=>response) unless response.nil?
    result
  end


end
