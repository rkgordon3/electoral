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

require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end
