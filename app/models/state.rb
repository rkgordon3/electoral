# == Schema Information
#
# Table name: states
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  abbrev          :string(255)
#  electoral_votes :integer
#  population      :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class State < ActiveRecord::Base
  validates :abbrev, :name, presence: true
  validates :abbrev, length: { :maximum => 2, :minimum => 2 }
  attr_accessible :abbrev, :electoral_votes, :name, :population
  has_many :voting_profiles
end
