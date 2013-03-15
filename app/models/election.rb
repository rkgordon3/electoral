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
  def event_for(player, date)
    next_day = date + 1.day
    res = events.where(:candidate_id => [ player.id, Candidate.find_by_name("candidate").id]).where(:date => date..next_day)
    res.size == 1 ? res[0] : res.select { |e| e.candidate_id == player.id }[0]
  end

  def active_candidates
    candidates.select { |c| c.name != "candidate" }
  end

end
