require 'csv'
require 'states'
class Profiles
	extend States

	#
	# Define profiles for election 
	# election : an election object
	# candidates : an array of candidate objects
	#
	def self.populate(election, candidates)

      VotingProfile.delete_all(["election_id = ?", election.id])

# When defining profile for non-swing states, I am making up
# data for now. I flipped values on alternate states, giving
# each candidate popular vote victory in 50% of non-swing states
arbitrary_vote_assignments = [200000, 800000, 1600000]
i = 0

CSV.open("lib/config/elections/us-electoral.csv").each do |ln|
  
  #puts "#{fields[1]}+#{fields[2]}+#{fields[3]}"
  s = State.find_by_abbrev(ln[0]) || State.create!(:name=>ln[1], 
                :abbrev=>ln[0], 
                :electoral_votes => ln[2].to_i)
  
  candidates.each_value do |c| 
  	VotingProfile.create!(:candidate=> c,
  						  :election => election ,
  		                  :state=> s, 
  		                  :votes => arbitrary_vote_assignments[i % 3])
    i += 1
  end unless swing_states.include?(s.abbrev)
end

VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("AZ"), 
	                  :votes=>250000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("AR"), 
	                  :votes=>418000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("FL"), 
	                  :votes=>2900000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("IA"), 
	                  :votes=>633000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("MI"), 
	                  :votes=>2153000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("MO"), 
	                  :votes=>1110000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("NV"), 
	                  :votes=>299000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("NH"), 
	                  :votes=>245000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("NM"), 
	                  :votes=>267000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("OR"), 
	                  :votes=>695000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("PA"), 
	                  :votes=>2460000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("TN"), 
	                  :votes=>980000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("UT"), 
	                  :votes=>200000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("WV"), 
	                  :votes=>291000)
VotingProfile.create!(:candidate=>candidates["Gore"], 
	                  :state=>State.find_by_abbrev("WI"), 
	                  :votes=>1240000)
####
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("AR"), 
	                  :votes=>470000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("AZ"), 
	                  :votes=>300000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("FL"), 
	                  :votes=>2900000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("IA"), 
	                  :votes=>628000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("MI"), 
	                  :votes=>1945000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("MO"), 
	                  :votes=>1190000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("NV"), 
	                  :votes=>301000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("NH"), 
	                  :votes=>273000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("NM"), 
	                  :votes=>259000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("OR"), 
	                  :votes=>691000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("PA"), 
	                  :votes=>2260000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("TN"), 
	                  :votes=>1060000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("UT"), 
	                  :votes=>300000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("WV"), 
	                  :votes=>332000)
VotingProfile.create!(:candidate=>candidates["Bush"], 
	                  :state=>State.find_by_abbrev("WI"), 
	                  :votes=>1234000)

end

 
end

