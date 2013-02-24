require 'candidates.rb'

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
  #
  # Return an array of outcomes
  #
  def outcome(*impacts, &blk)
    outcomes = []
    impacts.each_slice(2) { |rule, demographics| 
      outcomes << Outcome.new(rule, demographics) unless demographics.nil?
    }
    outcomes   
  end
end


class Policy < Event

  def responds(outcomes)
    # update defaults
    #@outcomes[:candidate] = @outcomes[:candidate].nil? ?  outcomes : @outcomes[:candidate].merge!(outcomes)
    outcomes
  end
  def method_missing(name, *args, &blk)
    begin
      return super
    end if candidates.include? name.is_a?(Symbol) ? name.to_s : name
    begin
      #
      # Place the outcomes under a trigger
      #
      { name.to_sym => args[0] }
    end if is_outcome?(args[0])
  end

  private

  def is_outcome?(arg) 
    arg.is_a?(Array) and arg.first.is_a?(Outcome)
  end

end
  
