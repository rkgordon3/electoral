# == Schema Information
#
# Table name: events
#
#  id          :integer         not null, primary key
#  date        :datetime
#  name        :string(255)
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  event_type  :string(255)
#  description :string(255)
#  caption     :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location_id, :location, :event_type, :description
  belongs_to :location, :class_name => "State"
  has_many :outcomes
end
