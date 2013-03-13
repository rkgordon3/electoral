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
#

class Game < ActiveRecord::Base
  attr_accessible :config_file, :start_date
  attr_writer  :current_turn
  belongs_to :election
  has_many   :player_states
  has_many   :voting_profiles
  belongs_to :player_in_turn, class_name: "Candidate", foreign_key: :candidate_id

  after_find { @nplayers = player_states.length }


  
  def advance(player, steps)
  	state_for(player).location += steps
  end

  def location(player)
  	state_for(player).location
  end

  def state_for(player) 
  	player_states.select { |s| s.player_id == player.id }[0]
  end

  def next_turn
    p " next_turn call current #{@@current_turn}" rescue "not defined"
      @@current_turn ||= 0
      return if @nplayers == 0
      @@current_turn = (@@current_turn + 1) % @nplayers
  end
end
