require 'stringio'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


VotingProfile.destroy_all
Candidate.destroy_all
Party.destroy_all
State.destroy_all
states = %Q["4,\"Alaska\",\"AK\",3,,\"2013-01-18 22:30:40.493981\",\"2013-01-18 22:30:40.493981\"\n5,\"Arizona\",\"AZ\",11,,\"2013-01-18 22:30:40.581472\",\"2013-01-18 22:30:40.581472\"\n6,\"Arkansas\",\"AR\",6,,\"2013-01-18 22:30:40.673099\",\"2013-01-18 22:30:40.673099\"\n7,\"California\",\"CA\",55,,\"2013-01-18 22:30:40.773018\",\"2013-01-18 22:30:40.773018\"\n8,\"Colorado\",\"CO\",9,,\"2013-01-18 22:30:40.864660\",\"2013-01-18 22:30:40.864660\"\n9,\"Connecticut\",\"CT\",7,,\"2013-01-18 22:30:40.960230\",\"2013-01-18 22:30:40.960230\"\n10,\"Delaware\",\"DE\",3,,\"2013-01-18 22:30:41.056238\",\"2013-01-18 22:30:41.056238\"\n11,\"Florida\",\"FL\",29,,\"2013-01-18 22:30:41.185109\",\"2013-01-18 22:30:41.185109\"\n12,\"Georgia\",\"GA\",16,,\"2013-01-18 22:30:41.276736\",\"2013-01-18 22:30:41.276736\"\n13,\"Hawaii\",\"HI\",4,,\"2013-01-18 22:30:41.368393\",\"2013-01-18 22:30:41.368393\"\n14,\"Idaho\",\"ID\",4,,\"2013-01-18 22:30:41.464434\",\"2013-01-18 22:30:41.464434\"\n15,\"Illinois\",\"IL\",20,,\"2013-01-18 22:30:41.556023\",\"2013-01-18 22:30:41.556023\"\n16,\"Indiana\",\"IN\",11,,\"2013-01-18 22:30:41.655971\",\"2013-01-18 22:30:41.655971\"\n17,\"Iowa\",\"IA\",6,,\"2013-01-18 22:30:41.770568\",\"2013-01-18 22:30:41.770568\"\n18,\"Kansas\",\"KS\",6,,\"2013-01-18 22:30:41.872520\",\"2013-01-18 22:30:41.872520\"\n19,\"Kentucky\",\"KY\",8,,\"2013-01-18 22:30:41.964162\",\"2013-01-18 22:30:41.964162\"\n20,\"Louisiana\",\"LA\",8,,\"2013-01-18 22:30:42.055840\",\"2013-01-18 22:30:42.055840\"\n21,\"Maine\",\"ME\",4,,\"2013-01-18 22:30:42.147460\",\"2013-01-18 22:30:42.147460\"\n22,\"Maryland\",\"MD\",10,,\"2013-01-18 22:30:42.239036\",\"2013-01-18 22:30:42.239036\"\n23,\"Massachusetts\",\"MA\",11,,\"2013-01-18 22:30:42.330657\",\"2013-01-18 22:30:42.330657\"\n24,\"Michigan\",\"MI\",16,,\"2013-01-18 22:30:42.422295\",\"2013-01-18 22:30:42.422295\"\n25,\"Minnesota\",\"MN\",10,,\"2013-01-18 22:30:42.505600\",\"2013-01-18 22:30:42.505600\"\n26,\"Mississippi\",\"MS\",6,,\"2013-01-18 22:30:42.597211\",\"2013-01-18 22:30:42.597211\"\n27,\"Missouri\",\"MO\",10,,\"2013-01-18 22:30:42.672204\",\"2013-01-18 22:30:42.672204\"\n28,\"Montana\",\"MT\",3,,\"2013-01-18 22:30:42.738856\",\"2013-01-18 22:30:42.738856\"\n29,\"Nebraska\",\"NE\",5,,\"2013-01-18 22:30:42.809459\",\"2013-01-18 22:30:42.809459\"\n30,\"Nevada\",\"NV\",6,,\"2013-01-18 22:30:42.898326\",\"2013-01-18 22:30:42.898326\"\n31,\"New Hampshire\",\"NH\",4,,\"2013-01-18 22:30:42.972039\",\"2013-01-18 22:30:42.972039\"\n32,\"New Jersey\",\"NJ\",14,,\"2013-01-18 22:30:43.038674\",\"2013-01-18 22:30:43.038674\"\n33,\"New Mexico\",\"NM\",5,,\"2013-01-18 22:30:43.105328\",\"2013-01-18 22:30:43.105328\"\n34,\"New York\",\"NY\",29,,\"2013-01-18 22:30:43.171972\",\"2013-01-18 22:30:43.171972\"\n35,\"North Carolina\",\"NC\",15,,\"2013-01-18 22:30:43.238601\",\"2013-01-18 22:30:43.238601\"\n36,\"North Dakota\",\"ND\",3,,\"2013-01-18 22:30:43.305239\",\"2013-01-18 22:30:43.305239\"\n37,\"Ohio\",\"OH\",18,,\"2013-01-18 22:30:43.375791\",\"2013-01-18 22:30:43.375791\"\n38,\"Oklahoma\",\"OK\",7,,\"2013-01-18 22:30:43.446830\",\"2013-01-18 22:30:43.446830\"\n39,\"Oregon\",\"OR\",7,,\"2013-01-18 22:30:43.517414\",\"2013-01-18 22:30:43.517414\"\n40,\"Pennsylvania\",\"PA\",20,,\"2013-01-18 22:30:43.588431\",\"2013-01-18 22:30:43.588431\"\n41,\"Rhode Island\",\"RI\",4,,\"2013-01-18 22:30:43.658991\",\"2013-01-18 22:30:43.658991\"\n42,\"South Carolina\",\"SC\",9,,\"2013-01-18 22:30:43.730035\",\"2013-01-18 22:30:43.730035\"\n43,\"South Dakota\",\"SD\",3,,\"2013-01-18 22:30:43.817705\",\"2013-01-18 22:30:43.817705\"\n44,\"Tennessee\",\"TN\",11,,\"2013-01-18 22:30:43.900552\",\"2013-01-18 22:30:43.900552\"\n45,\"Texas\",\"TX\",38,,\"2013-01-18 22:30:43.975543\",\"2013-01-18 22:30:43.975543\"\n46,\"Utah\",\"UT\",6,,\"2013-01-18 22:30:44.050485\",\"2013-01-18 22:30:44.050485\"\n47,\"Vermont\",\"VT\",3,,\"2013-01-18 22:30:44.125521\",\"2013-01-18 22:30:44.125521\"\n48,\"Virginia\",\"VA\",13,,\"2013-01-18 22:30:44.208760\",\"2013-01-18 22:30:44.208760\"\n49,\"Washington\",\"WA\",12,,\"2013-01-18 22:30:44.283746\",\"2013-01-18 22:30:44.283746\"\n50,\"West Virginia\",\"WV\",5,,\"2013-01-18 22:30:44.358702\",\"2013-01-18 22:30:44.358702\"\n51,\"Wisconsin\",\"WI\",10,,\"2013-01-18 22:30:44.433692\",\"2013-01-18 22:30:44.433692\"\n52,\"Wyoming\",\"WY\",3,,\"2013-01-18 22:30:44.508722\",\"2013-01-18 22:30:44.508722\"\n53,\"District of Columbia\",\"DC\",3,,\"2013-01-18 22:30:44.583626\",\"2013-01-18 22:30:44.583626\"\n3,\"Alabama\",\"AL\",9,,\"2013-01-18 22:30:40.377398\",\"2013-01-18 22:30:40.377398\"\n]

StringIO.new(states).each_line do |ln|
  fields = ln.scan(/[(\w+) ]+/)
  puts "#{fields[1]}+#{fields[2]}+#{fields[3]}"
  State.create!(:name=>fields[1], 
                :abbrev=>fields[2], 
                :electoral_votes => fields[3].to_i)
end


rep = Party.create!(:name => "Republican")
dem = Party.create!(:name => "Democratic")

bush = Candidate.create!(:name=>"Bush", :party=>rep)
gore = Candidate.create!(:name=>"Gore", :party=>dem)





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


