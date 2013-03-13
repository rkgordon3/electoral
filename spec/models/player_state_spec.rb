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

require 'spec_helper'

describe PlayerState do
  pending "add some examples to (or delete) #{__FILE__}"
end
