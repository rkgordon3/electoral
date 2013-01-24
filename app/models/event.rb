class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location_id, :location
  belongs_to :location, :class_name => "State"
end
