class Election < ActiveRecord::Base
  attr_accessible :game_id, :name
  has_many :events
  belongs_to :game
end
