require 'singleton'

class Configuration
  include Singleton

  attr_reader :events

  def initialize 
    @events = []
    @event_map = {}
  end

  def add_event e
    @events << e
    @event_map[e.caption] = e
  end

  def event_for_caption(caption) 
  	@event_map[caption]
  end



end
