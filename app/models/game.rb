# == Schema Information
#
# Table name: games
#
#  id           :integer         not null, primary key
#  election_id  :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  config_file  :string(255)
#  start_date   :date
#  candidate_id :integer
#  current_turn :integer         default(0)
#  max_position :integer
#

class Game < ActiveRecord::Base
  attr_accessible :config_file, :start_date
  belongs_to :election
  has_many   :player_states, autosave: :true
  belongs_to :player_in_turn, class_name: "Candidate", foreign_key: :candidate_id
  
  def advance(player, steps)
    s = state_for(player)
    s.location = [self.max_position, s.location + steps].min
    s.save
  end

  def location(player)
  	state_for(player).location
  end

  def state_for(player) 
  	player_states.select { |s| s.player_id == player.id }[0]
  end

  def next_turn
    self.current_turn = (self.current_turn + 1) % player_states.size
    self.player_in_turn = self.election.active_candidates[self.current_turn]
  end

  def setup(an_election = nil)
    election = self.election ||= an_election
    player_states.delete_all
    election.active_candidates.collect { |c| 
      self.player_states.build(player_id: c.id, type_of: c.class.to_s)
    } 
    self.current_turn = 0
    self.max_position = election.campaign_length
    self.player_in_turn = election.active_candidates[0]
    self.election = election
    self.save
  end

  def over?
     player_states.select { |p| p.location == self.max_position }.size == player_states.size
  end
end
