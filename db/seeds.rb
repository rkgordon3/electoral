# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vps = VotingProfile.all

vps.each { |p| p.destroy } if vps.length > 0

bush = Candidate.find_by_name("Bush")
gore = Candidate.find_by_name("Gore")
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("AR"), 
	                  :votes=>418000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("FL"), 
	                  :votes=>2900000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("IA"), 
	                  :votes=>633000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("MI"), 
	                  :votes=>2153000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("MO"), 
	                  :votes=>1110000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("NV"), 
	                  :votes=>279000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("NH"), 
	                  :votes=>245000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("NM"), 
	                  :votes=>267000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("OR"), 
	                  :votes=>695000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("PA"), 
	                  :votes=>2460000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("TN"), 
	                  :votes=>980000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("WV"), 
	                  :votes=>291000)
VotingProfile.create!(:candidate=>gore, 
	                  :state=>State.find_by_abbrev("WI"), 
	                  :votes=>1240000)
####
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("AR"), 
	                  :votes=>470000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("FL"), 
	                  :votes=>2900000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("IA"), 
	                  :votes=>628000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("MI"), 
	                  :votes=>1945000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("MO"), 
	                  :votes=>1190000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("NV"), 
	                  :votes=>301000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("NH"), 
	                  :votes=>273000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("NM"), 
	                  :votes=>259000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("OR"), 
	                  :votes=>691000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("PA"), 
	                  :votes=>2260000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("TN"), 
	                  :votes=>1060000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("WV"), 
	                  :votes=>332000)
VotingProfile.create!(:candidate=>bush, 
	                  :state=>State.find_by_abbrev("WI"), 
	                  :votes=>1234000)