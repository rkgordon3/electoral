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
#

class Game < ActiveRecord::Base
  attr_accessible :config_file, :start_date
  belongs_to :election
  has_many   :player_states
  belongs_to :player_in_turn, class_name: "Candidate", foreign_key: :candidate_id
  
  def advance(player, steps)
    s = state_for(player)
  	s.location += steps
    s.save
  end

  def location(player)
  	state_for(player).location
  end

  def state_for(player) 
  	player_states.select { |s| s.player_id == player.id }[0]
  end

  def next_turn
    puts "switching turn form #{self.current_turn} witn #{player_states.size} players"
    self.current_turn = (self.current_turn + 1) % player_states.size
    puts "+++++++ setting #{self.election.active_candidates[self.current_turn].name} in turn at #{self.current_turn}"
    self.player_in_turn = self.election.active_candidates[self.current_turn]
  end

  def setup(an_election)
   # @game.election = Election.first
    self.election = an_election
    an_election.active_candidates.collect { |c| 
      player_states.build(player_id: c.id, type_of: c.class.to_s)
    } 
    self.player_in_turn = self.election.active_candidates[0]
  end
end
