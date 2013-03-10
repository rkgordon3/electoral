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
  attr_accessible :game_id, :name
  has_many :events
  belongs_to :game
end
