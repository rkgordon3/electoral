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
  attr_reader :event_description

  def initialize(caption = nil) 
    @caption = caption
    @pending = {}
    @outcomes = {}
    @candidate = :candidate
  end
  def method_missing(name, *args, &blk)
    puts "mm=============> #{name}"
 
    if name.to_s == "responds"
      raise ArgumentError.new(message: "responds can not appear within a generic event.")
    else
      #puts "merging #{name} with args #{args.inspect}"
      merge_outcomes(@outcomes, name, Marshal.load(Marshal.dump(args[0])))
    end
    @pending = {}
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
    @event_description = d
  end
  def date(d)
    @event_date = Date.strptime d, "%m/%d/%Y"
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
    #puts "for #{name} merge #{args.inspect} of type #{args.class} into #{hash} of type #{hash.class}"
    csym = name.to_sym
    case args
    when Hash
      hash[csym] = hash[csym].nil? ? args : hash[csym].merge!(args)     
    when Array 
      hash[csym] = hash[csym].nil? ? args : hash[csym]<<args[0]
    else
    end
  end

  private
  def complete
    @outcomes.merge!(@pending)
    #puts "outcomes for #{event_date} #{@outcomes.inspect}"
    generic_outcomes = @outcomes[:candidate]
    generic_outcomes.each_pair { |k,v| 

        @outcomes.each_key { |target|
           puts "merging default in #{target}"
           @outcomes[target].reverse_merge!(generic_outcomes)
        }
    } unless generic_outcomes.nil?
    self.class.to_s =~ /(.*)Descriptor/
    @event_type = $~[1].downcase
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
    end if Candidates.candidates.include? name.is_a?(Symbol) ? name.to_s : name
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

class ElectionDescriptor 
  attr_reader :caption, :event_date

  def intialize(caption) 
    @caption = caption
  end

  def caption
    @caption
  end


  def date(d)
    @event_date = d
  end

  def candidate
  end
end

  
