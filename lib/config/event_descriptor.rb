require 'elections/pres2008/candidates.rb'

class OutcomeDescriptor
  attr_reader :rule, :demographics
  def initialize(rule, demographics)
    @rule = rule
    @demographics = demographics.kind_of?(Array) ? demographics : [ demographics ] 
  end
end

class EventDescriptor
  include Candidates
  attr_reader :outcomes
  attr_accessor :candidate
  attr_accessor :event_date

  def initialize(caption = nil) 
    @caption = caption
    @outcomes = {}
    @candidate = :candidate
  end

  def method_missing(name, *args, &blk)
    csym = name.to_sym
    @outcomes[csym] = @outcomes[csym].nil? ? args[0] : @outcomes[csym].merge!(args[0])
  end


  def trigger(name) 
    @candidate = name
  end


  def caption(n)
    @caption = n
  end
  def caption
    @caption
  end
  def description(d)
    @description = d
  end
  def date(d)
    @event_date = d
  end
  def outcome(*impacts, &blk)
    outcomes = []
    impacts.each_slice(2) { |rule, demographics| 
      outcomes << OutcomeDescriptor.new(rule, demographics) unless demographics.nil?
    }
    outcomes   
  end
end


class PolicyDescriptor < EventDescriptor

  def responds(outcomes)
    outcomes
  end
  # 
  def method_missing(name, *args, &blk)
    #
    # If name argument matches a candidate name, invoke super
    #
    begin
      return super
    end if candidates.include? name.is_a?(Symbol) ? name.to_s : name
    #
    #  else name is a response value
    #
    begin
      { name.to_sym => args[0] }
    end if is_outcome?(args[0])
  end

  private

  def is_outcome?(arg) 
    arg.is_a?(Array) and arg.first.is_a?(OutcomeDescriptor)
  end

end
  
