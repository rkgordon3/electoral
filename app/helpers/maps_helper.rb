module MapsHelper
	def state_tag(abbrev)
		"US-"+abbrev
	end
	def json_electoral_votes
	    votes = {}
	    State.all.each { |s|   votes[state_tag(s.abbrev)] = s.electoral_votes.to_s }
	    votes.to_json.html_safe
	end
	def json_voting_profiles
		profiles = {}
		State.all.each  do  |s| 
			profiles[state_tag(s.abbrev)] = []
			s.voting_profiles.each do  |vp| 
				profiles[state_tag(s.abbrev)] << { :name => vp.candidate.name, :votes => vp.votes }
			end
		end
		profiles.to_json.html_safe
	end

	def election_year
        "2008"
    end
end
