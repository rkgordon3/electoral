# == Schema Information
#
# Table name: elections
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  date       :date
#

# == Schema Information
#
# Table name: elections
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Election < ActiveRecord::Base
  validates  :name, presence: true
  #, uniqueness: { case_sensitive: false }
  attr_accessible :game_id, :name, :date
  has_many :events
  has_many :candidates
  belongs_to :game

  attr_reader :start_date

  def start_date
  	@start_date ||= Date.new(date.year, date.month-2, 1)
  end
  #
  # Convert a value represent 'days into campaign' into
  # a date
  #
  def campaign_date(to)
    start_date + to.days
  end

  #
  # Return event for player on given date
  def event_for(candidate, date)
    results = events.where(:date => date..(date + 1.day))
    results.where(:candidate_id =>  candidate.id)[0] || results.where(:candidate_id => Candidate.find_by_name("candidate"))[0]
  end

  def active_candidates
    candidates.select { |c| c.name != "candidate" }
  end

end
