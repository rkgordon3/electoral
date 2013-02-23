require 'candidates.rb'

class Outcome
  def initialize(rule, demographics, trigger = nil)
    @rule = rule
    @demographics = demographics.kind_of?(Array) ? demographics : [ demographics ] 
    @trigger = trigger
  end

  def trigger=(val)
    @trigger = val
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
    p "mm #{self.class}"
    @outcomes[name] = args[0][:candidate]
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
    @outcomes[:candidate] = [] if not @outcomes.has_key?(:candidate)
    impacts.each_slice(2) { |rule, demographics| 
      @outcomes[:candidate] << Outcome.new(rule, demographics) unless demographics.nil?
    }
    @outcomes   
  end
end


class Policy < Event

  def response(outcomes)
    outcomes
  end
  def method_missing(name, *args, &blk)
    p "policy mm #input #{name} #{name.class}"
    p "mm #{candidates} : #{candidates.include? name}"
    begin
      p "policy mm #{name}"
      p "self class #{self.class}"
      p "super.class #{super.class}"
      super.method_missing(name, args, blk)
      return
    end if candidates.include? name.is_a?(Symbol) ? name.to_s : name
    begin
      args[0].each_value { |v|
        v.each { |o| o.trigger = name.to_sym } 
      } 
      args[0] # return array of outcomes
    end if is_outcome?(args[0])
  end

  private

  def is_outcome?(arg) 
    puts "is outcome #{arg.is_a?(Hash) and arg.first[1][0].is_a?(Outcome)}"
    arg.is_a?(Hash) and arg.first[1][0].is_a?(Outcome)
  end

end
  
