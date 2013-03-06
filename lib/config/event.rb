require 'elections/pres2008/candidates.rb'

class Outcome
  def initialize(rule, demographics)
    @rule = rule
    @demographics = demographics.kind_of?(Array) ? demographics : [ demographics ] 
  end
end

class Event 
  include Candidates
  attr_reader :outcomes

  def initialize(caption = nil) 
    @caption = caption
    @outcomes = {}
    @candidate = :candidate
  end

  def method_missing(name, *args, &blk)
    csym = name.to_sym
    @outcomes[csym] = @outcomes[csym].nil? ? args[0] : @outcomes[csym].merge!(args[0])
  end


  def candidate(name) 
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
    @date = d
  end
  def outcome(*impacts, &blk)
    outcomes = []
    impacts.each_slice(2) { |rule, demographics| 
      outcomes << Outcome.new(rule, demographics) unless demographics.nil?
    }
    outcomes   
  end
end


class Policy < Event

  def response(outcomes)
    outcomes
  end

  def method_missing(name, *args, &blk)
    begin
      return super
    end if candidates.include? name.is_a?(Symbol) ? name.to_s : name
    begin
      { name.to_sym => args[0] }
    end if is_outcome?(args[0])
  end

  private

  def is_outcome?(arg) 
    arg.is_a?(Array) and arg.first.is_a?(Outcome)
  end

end
  
