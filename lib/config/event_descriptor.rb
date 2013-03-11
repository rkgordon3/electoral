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
 
    return unless candidates.include? name.is_a?(Symbol) ? name.to_s : name
    p "event mm #{args[0].class}"
    csym = name.to_sym
    case 

    when args[0].is_a?(Array)
      #
      # If arg[0] is an array, the array consists of
      # non-triggered outcomes.
      #
      p "array of outcomes for #{csym}"
      @outcomes[csym] = @outcomes[csym].nil? ? args[0] : @outcomes[csym].concat!(args[0])
      return
    when args[0].is_a?(Hash)
      #
      #  Triggered outcome appear in an hash, with a single key which is 
      # the trigger.
      #
      p "hash of outcomes #{args[0]} for #{csym}"
      if @outcomes[csym].nil?
        @outcomes[csym] =  args[0] 
      else
        args[0].each_pair  do |k,v|
          p "concating at #{k} values #{v} to #{@outcomes[csym]}"
          @outcomes[csym].has_key?(k) ? @outcomes[csym][k].concat!(v) : @outcomes[csym][k] = v 
        end 
      end
    else
      puts 'illegal value to '
    end
      
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
      #
      # Place the outcomes under a trigger
      #
      { name.to_sym => args[0] }
    end if is_outcome?(args[0])
  end

  private

  def is_outcome?(arg) 
    arg.is_a?(Array) and arg.first.is_a?(OutcomeDescriptor)
  end

end
  
