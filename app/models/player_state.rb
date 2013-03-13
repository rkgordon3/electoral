# == Schema Information
#
# Table name: player_states
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  player_id  :integer
#  location   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  type_of    :string(255)
#

class PlayerState < ActiveRecord::Base
  attr_accessible :game_id, :location, :player_id, :type_of
end
