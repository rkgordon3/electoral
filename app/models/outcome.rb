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

class Outcome < ActiveRecord::Base
  attr_accessible :trigger, :candidate_id, :delta, :event_id, :candidate, :event
  belongs_to :candidate
  belongs_to :event
  # an outcome impacts many demographics
  has_many :demographics


  def apply
  	demographics.each do |demo|
      profile = candidate.profile_for(demo)
  		profile.votes += profile.votes * (delta/100.0)
  		profile.save
    end
  end
end
