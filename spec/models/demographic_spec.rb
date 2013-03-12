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

require 'spec_helper'

describe Demographic do
  pending "add some examples to (or delete) #{__FILE__}"
end
