class GameSession < ActiveRecord::Base
	include GameBase
  attr_accessible :game_id, :game
  belongs_to :game

end
