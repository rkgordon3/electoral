# == Schema Information
#
# Table name: game_sessions
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class GameSession < ActiveRecord::Base
	include GameBase
  attr_accessible :game_id, :game
  belongs_to :election
  has_many   :player_states
  has_many   :voting_profiles
end
