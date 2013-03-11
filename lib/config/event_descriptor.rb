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
  attr_reader :pending
  attr_accessor :candidate
  attr_accessor :event_date

  def initialize(caption = nil) 
    @caption = caption
    @pending = {}
    @outcomes = {}
    @candidate = :candidate
  end

  def method_missing(name, *args, &blk)
    merge_outcomes(@outcomes, name, Marshal.load(Marshal.dump(args[0])))
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



  #
  # Return an array of outcomes
  #
  def outcome(*impacts, &blk)
    outcomes = []
    impacts.each_slice(2) { |rule, demographics| 
      outcomes << OutcomeDescriptor.new(rule, demographics) unless demographics.nil?
    }
    outcomes   
  end

  protected

  def merge_outcomes(hash, name, args) 
    csym = name.to_sym
    hash[csym] = hash[csym].nil? ? args : hash[csym].merge!(args)     
  end

  private
  def complete
    @outcomes.merge!(@pending)
  end
end


class PolicyDescriptor < EventDescriptor

  def responds(outcomes)
    merge_outcomes(@pending, :candidate, outcomes)
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
      #
      # Place the outcomes under a response trigger
      #
      { name.to_sym => args[0] }
    end if is_outcome?(args[0])
  end

  private

  def is_outcome?(arg) 
    arg.is_a?(Array) and arg.first.is_a?(OutcomeDescriptor)
  end

end
  
