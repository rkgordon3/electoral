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
  # Return all outcomes for this event for a candidate. candidate
  # may be either a string for candidate name, a Candidate instance or an id.
  #
  # If candidate is nil, return all outcomes for this event
  #
  # If response is supplied, results are filtered to that
  # value
  #
  def outcomes_for(candidate = nil, response = nil) 
    puts "event #{self.name} outcomes for #{candidate} for response #{response}"
    return outcomes if candidate.nil?
    result = nil
  	case candidate
  	when Candidate
  		result = outcomes.where(:candidate_id => candidate.id)
  	when Fixnum
  		result = outcomes.where(:candidate_id => candidate)
  	else
  		result = outcomes.where(:candidate_id => Candidate.find_by_name(candidate))
  	end
    result = result || outcomes.where(:name => "candidate")
    result = result.where(:trigger=>response) unless response.nil?
    result
  end

  def apply_outcomes(candidate = nil, response = nil)
    # Is there a response-based candidate outcome?
    current_outcomes = outcomes_for(candidate, response)
    current_outcomes ||= outcomes
    puts "****** applying #{outcomes.inspect}"
    outcomes.map(&:apply)
  end


end
