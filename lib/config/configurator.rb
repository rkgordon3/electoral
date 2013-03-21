require 'root.rb'
require 'events.rb'
require "#{Root::Election}/candidates.rb"
require "#{Root::Election}/profiles"
require 'states.rb'
require 'election_configuration.rb'


class Configurator

include States
include Events
include Candidates


attr_reader :events

def initialize(name, date)
  puts "configure #{name} for date #{date}"
  @date = date.is_a?(String) ? date.to_date : date
  @name = name
  @events = []
  @event_map = {}
  instance_eval File.open("./lib/config/elections/#{name}/campaign_events.rb").readlines.join(";")
end


def describe event, &blk
  puts "describe #{event.name}"
   event.instance_eval &blk
   event.send "complete"
   add_event event
end

def add_event e
  @events << e
  @event_map[e.caption] = e
end

def event_for_caption(caption) 
  @event_map[caption]
end

def candidates
  Candidates.candidates
end

def persist
  parties = ["Republican", "Democratic"]


  parties.each { |n| Party.create!(name: n) }
  images = [ "icon-star", "icon-glass"]

  i = 0
  election = Election.create!(name: @name, date: @date)
  generic_candidate = Candidate.create!(name: "candidate", election: election)
  candidates.each { |c|
    mc = Candidate.create!(election: election, name: c, party_id: Party.find_by_name(parties[i % 2]).id, image: images[i%2])
    election.candidates << mc
    i += 1
  }

  hash = Candidate.where(["election_id = ?", election.id]).where(["name != ?", "candidate"]).index_by(&:name)
  Profiles.populate(election, hash)

  @events.each { |e| 
    puts "++++++++++++++++++Loading event #{e.caption} of type #{e.event_type}"
    event = Event.create!(date: e.event_date, 
                      name: e.caption,
                      description: e.event_description,
                      event_type: e.event_type,
                      election_id: election.id,
                      trigger_candidate: Candidate.find_by_name_and_election_id(e.candidate, election.id))
    e.outcomes.each_key { |candy| 
      
      outcomes_for_candy = e.outcomes[candy]
      candy_id = Candidate.find_by_name(candy.to_s).id 
      case outcomes_for_candy
        
      when Array
        puts "array outcome for #{candy} : #{outcomes_for_candy.inspect}"
        outcomes_for_candy.each do |oc|
          outc = Outcome.create!(
                          event_id: event.id,
                          delta: oc.rule,
                          candidate_id: candy_id)
          oc.demographics.each do |s|
            Demographic.create!(type_of: State.to_s, 
                                 value_id: State.find_by_abbrev(s).id,
                                 outcome_id: outc.id)
          end
        end
        # no triggering response
      when Hash
        outcomes_for_candy.each_key do |response|
          outcomes_for_response = outcomes_for_candy[response]
          outcomes_for_response.each do |oc|
            puts "\t\t Response #{response}"
            outc = Outcome.create!(
                          event_id: event.id,
                          delta: oc.rule,
                          candidate_id: candy_id,
                          trigger: response)
      
            oc.demographics.each do |s|
              Demographic.create!(type_of: State.to_s, 
                                 value_id: State.find_by_abbrev(s).id,
                                 outcome_id: outc.id)
            end
          end    
        end
      else 
      end
    }
    election.events << event
  }
  election.save
  election
end



begin

 # Configurator.new("pres2008").instance_eval File.open("#{Root::Election}/campaign_events.rb").readlines.join(";")

rescue  Exception => e
  
  e.backtrace[0] =~ /[a-z]+\.rb:[0-9]+/
  begin
    print e.message + " at line " + $~[0]
    puts "...Probably a mistyped state abbreviation" if e.message.start_with?("uninitialized constant")
  end unless $~.nil?

  puts e.backtrace
end


end

