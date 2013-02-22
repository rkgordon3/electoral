class Configuration
  include Singleton

  attr_reader :events

  def initialize 
    @events = []
  end

  def add_event e
    @events << e
  end



end
