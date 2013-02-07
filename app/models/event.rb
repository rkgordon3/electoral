class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location_id, :location, :event_type, :description
  belongs_to :location, :class_name => "State"
  has_many :outcomes
end
