# == Schema Information
#
# Table name: demographics
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  value_id   :integer
#  outcome_id :integer
#  type_of    :string(255)
#

class Demographic < ActiveRecord::Base
  attr_accessible :type_of, :value_id, :outcome_id
  belongs_to :outcome
end
